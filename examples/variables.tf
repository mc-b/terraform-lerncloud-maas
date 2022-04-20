###
# Allgemeine Variablen


# API Key in separater Datei config.tf speichern

#variable "key" {
#    type    = string
#    default = "..."
#    sensitive   = true
#}

# Public Variablen

variable "userdata" {
    description = "Cloud-init Script"
    default = "base.yaml"
}

# Scripts

data "template_file" "userdata" {
  template = file(var.userdata)
}
