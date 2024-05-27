variable "vm_web" {
  type = object({
    name = string
    family = string
    platform_id = string
    preemptible = bool
    nat = bool
  })
  default = {
    family = "ubuntu-2004-lts"
    name = "netology-develop-platform-web"
    platform_id = "standard-v1"
    preemptible = true
    nat = true
  }
} 

variable "vm_db" {
  type = object({
    name = string
    zone = string
    family = string
    platform_id = string
    preemptible = bool
    nat = bool
  })
  default = {
    family = "ubuntu-2004-lts"
    name = "netology-develop-platform-db"
    platform_id = "standard-v1"
    zone = "ru-central1-b"
    preemptible = true
    nat = true
  }
} 

variable vms_resources {
type = map 
default = {
  web = {
    cores = 2
    memory = 1
    core_fraction = 5
  },
  db = {
    cores = 2
    memory = 2
    core_fraction = 20
  }
}
}


