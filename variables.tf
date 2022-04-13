
# Allgemeine Variablen


# Public Variablen

variable "module" {
    type    = string
    default = "base"
}

variable "userdata" {
    description = "Cloud-init Script"
    default = "/../../modules/base.yaml"
}

variable "ports" {
    type    = list(number)
    default = [ 22, 80 ]
}

# wird nicht ausgewertet - nur zu Kompatibilitaet zu Mulitpass
variable "mem" {
    type    = string
    default = "2GB"
}

# wird nicht ausgewertet - nur zu Kompatibilitaet zu Mulitpass
variable "disk" {
    type    = string
    default = "32GB"
}

# wird nicht ausgewertet - nur zu Kompatibilitaet zu Mulitpass
variable "cpu" {
    default = 2
}

# Scripts

data "template_file" "userdata" {
  template = file(var.userdata)
}
