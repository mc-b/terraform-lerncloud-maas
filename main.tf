###
#   Ressourcen
#

resource "maas_instance" "vm" {
    deploy_hostname = var.module
    user_data       = base64encode(data.template_file.userdata.rendered)
    release_erase   = false
}


