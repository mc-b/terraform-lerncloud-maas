###
#   Outputs wie IP-Adresse und DNS Name
#  

output "ip_vm" {
  value = try(
    format(
      "%s.%s",
      replace(join(".", slice(split("-", var.vpn), 0, 3)), "-", "."),
      element(slice(split("-", maas_vm_instance.vm.hostname), 1, 2), 0)
    ),
    maas_vm_instance.vm.ip_addresses
  )
  description = "The IP address of the server instance."
}

output "fqdn_vm" {
  value = "${maas_vm_instance.vm.hostname}.maas" 
  description = "The FQDN of the server instance."
}

output "description" {
  value = var.description 
  description = "Description VM"
}
