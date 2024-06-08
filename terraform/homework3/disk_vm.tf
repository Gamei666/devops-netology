resource "yandex_compute_disk" "disks" {
  count = 3
  name     = "disk-${count.index+1}"
  type     = "network-ssd"
  zone     = "ru-central1-a"
  size = 1
}

resource "yandex_compute_instance" "disk_vm" {
  name = "storage"
  platform_id = var.vm_common.platform_id
  resources {
    cores         = var.vm_resources.web.cores
    memory        = var.vm_resources.web.memory
    core_fraction = var.vm_resources.web.core_fraction
      }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic secondary_disk {
     for_each = yandex_compute_disk.disks
     content {
        disk_id = secondary_disk.value["id"]
     }
  }
  scheduling_policy {
    preemptible = var.vm_common.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_common.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    user-data = local.ssh
  }
}