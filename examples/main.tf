###
# Neue Data Sources und Resources

# einzelner KVM Host 01
data "maas_vm_host" "kvm-01" {
  name = "cloud-hf-39"
}

# einzelner KVM Host 02
data "maas_vm_host" "kvm-02" {
  name = "cloud-hf-20"
}

# Alle KVM Hosts
data "maas_vm_hosts" "vm-hosts" {
  id  = "rack-01"
}

# Alle bekannten Machines vom MAAS Rack
data "maas_machines" "machines" {
  id  = "rack-01"
}

# Erstellung einer VM auf dem KVM Host welcher am meisten Memory hat
resource "maas_vm_instance" "order" {
  kvm_no = data.maas_vm_hosts.vm-hosts.recommended
  cpu_count = 2
  memory = 2048
  storage = 12
  hostname = "base-61"
  zone =  "10-6-37-0"
  # pool = "webshop"
  user_data = data.template_file.userdata.rendered
}

# Erstellung von "Anzahl KVM Host * 2" VM Instancen

resource "maas_vm_instance" "base" {
  count = length(data.maas_vm_hosts.vm-hosts.no) * 2
  kvm_no = data.maas_vm_hosts.vm-hosts.no[count.index % length(data.maas_vm_hosts.vm-hosts.no)]
  hostname = "base-${format("%02d", count.index + 10)}"
  description = "student ${format("%02d", count.index + 1)}"   
  zone =  "10-6-37-0"  
  # pool = "webshop"
  user_data = data.template_file.userdata.rendered
}






