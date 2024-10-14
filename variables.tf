
# MAP mit den Argumente pro VM

variable "machines" {
  type = map(object({
    module      = string       # "Modulname: wird als Hostname verwendet"
    description = string       # "Beschreibung VM"
    memory      = number       # "Memory in GB: bestimmt Instance in der Cloud"
    storage     = number       # "Groesse Disk"
    cores       = number       # "Anzahl CPUs"
    ports       = list(number) # "Ports welche in der Firewall geoeffnet sind"
    userdata    = string       # "Cloud-init Script"
  }))
}

# Verarbeiten der userdata-Datei im Modul
data "template_file" "userdata" {
  for_each = var.machines
  template = file(each.value.userdata) # Lade die Datei basierend auf dem übergebenen Pfad
}

# Zugriffs Informationen

variable "url" {
  description = "Evtl. URL fuer den Zugriff auf das API des Racks Servers"
  type        = string
}

variable "key" {
  description = "API Key, Token etc. fuer Zugriff"
  type        = string
  sensitive   = true
}

variable "vpn" {
  description = "Optional VPN welches eingerichtet werden soll"
  type        = string
  default     = "default"
}
