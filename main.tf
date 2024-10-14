###
#   Ressourcen
#

# KVM Hosts
data "maas_vm_hosts" "vm-hosts" {
  id = "vm-hosts-01"
}

resource "maas_vm_instance" "vm" {
  for_each = var.machines

  kvm_no      = data.maas_vm_hosts.vm-hosts.recommended
  hostname    = each.value.module
  description = each.value.description
  cpu_count   = each.value.cores
  memory      = each.value.memory * 1024
  storage     = each.value.storage
  #ports       = each.value.ports

  # Verwende den verarbeiteten Cloud-init Inhalt
  user_data = data.template_file.userdata[each.key].rendered

  zone = var.vpn
}



