locals {
    ssh = "${file("/home/mamahnin/Documents/ssh_keys.txt")}"

    storagelist = [
    for s in yandex_compute_instance.disk_vm:
    s.vm
  ]
}