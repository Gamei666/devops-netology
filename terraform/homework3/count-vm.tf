data "yandex_compute_image" "ubuntu" {
  family = var.vm_common.family
}
resource "yandex_compute_instance" "web" {
  depends_on = [ resource.yandex_compute_instance.db ]
  count = 2
  name = "web-${count.index+1}"
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