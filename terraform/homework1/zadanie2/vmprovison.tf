terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

variable "yc_secrets" {
  type = object({
    yc_token = string
    yc_cloud_id = string
    yc_folder_id = string
  })
  sensitive = true
}

provider "yandex" {
  token = var.yc_secrets.yc_token
  folder_id = var.yc_secrets.yc_folder_id
  cloud_id = var.yc_secrets.yc_cloud_id
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "zadanie2" {
  name        = "zadanie2"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    auto_delete = true
    initialize_params {
        name = "zadanie2"
        size = 15
        type = "network-ssd"
        image_id = "fd8l7gc412mngvuj92sd"
    }
  }

  network_interface {
    subnet_id = "e9bmgj345hf588jskskj"
    nat = true
  }

  metadata = {
    user-data = "${file("/home/mamahnin/Documents/ssh_keys.txt")}"
  }
}

output "external_ip_address" {
  value = yandex_compute_instance.zadanie2.network_interface.0.nat_ip_address
}
