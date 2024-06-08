variable vm_common {
  type = map
  default = {
    family = "ubuntu-2004-lts"
    platform_id = "standard-v1"
    nat = true
    preemptible = true  
  }
} 

variable vm_resources {
type = map 
default = {
  web = {
    cores = 2
    memory = 1
    core_fraction = 5
  },
}
}

variable "each_vm" {
  type = list(object({  
    vm_name=string, 
    cpu=number, 
    ram=number,
    core_fraction = number, 
    disk_volume=number }))
  default = [ {
    vm_name = "main"
    cpu = 4
    ram = 4
    core_fraction = 100
    disk_volume = 20
  }, 
  {
    vm_name = "replica"
    cpu = 2
    ram = 2
    core_fraction = 20
    disk_volume = 10
  }]
}