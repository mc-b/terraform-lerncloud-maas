###
#   Outputs wie IP-Adresse und DNS Name
#  

output "ip_vm" {
  value = "see MAAS UI"
  description = "The IP address of the server instance."
}

output "fqdn_vm" {
  value = maas_instance.vm.deploy_hostname 
  description = "The FQDN of the server instance."
}