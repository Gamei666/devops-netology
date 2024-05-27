resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "developdb" {
  name           = var.alt_vpc_name
  zone           = var.alt_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.alt_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web.family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vmname.vm1
  platform_id = var.vm_web.platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web.nat
  }

  metadata = var.meta
}

resource "yandex_compute_instance" "platformdb" {
  name        = local.vmname.vm2
  platform_id = var.vm_db.platform_id
  zone = var.vm_db.zone
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.developdb.id
    nat       = var.vm_db.nat
  }

  metadata = var.meta
}
