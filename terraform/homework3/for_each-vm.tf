resource "yandex_compute_instance" "db" {
  for_each = { for db in var.each_vm : db.vm_name => db }
  name = each.key
  platform_id = var.vm_common.platform_id
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
      }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
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