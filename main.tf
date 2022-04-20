###
#   Ressourcen
#

# KVM Hosts
data "maas_vm_hosts" "vm-hosts" {
  id  = "vm-hosts-01"
}

resource "maas_vm_instance" "vm" {
  kvm_no = data.maas_vm_hosts.vm-hosts.recommended
  cpu_count = var.cores
  memory = var.memory * 1024
  storage = var.storage
  hostname = "${var.module}"
  zone =  "${var.vpn}"
  description = "${var.description}"
  user_data = data.template_file.userdata.rendered
}



