variable "name" {
  type = string
}

variable "network_id" {
    type = string
}

variable "subnet_zone" {
    type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "HA" {
  type = bool
  
}