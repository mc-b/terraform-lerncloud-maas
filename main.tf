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
  hostname    = each.value.hostname
  description = coalesce(each.value.description, var.description)
  cpu_count   = coalesce(each.value.cores, var.cores)
  memory      = coalesce(each.value.memory, var.memory) * 1024
  storage     = coalesce(each.value.storage, var.storage)
  #ports       = var.ports

  # Verwende den verarbeiteten Cloud-init Inhalt
  user_data = data.template_file.userdata[each.key].rendered

  zone = var.vpn
}



