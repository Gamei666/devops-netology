variable "name" {
  type = string
}

variable "dbname" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "password" {
   type = string
   sensitive = true
}