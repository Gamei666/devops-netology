data "yandex_compute_instance" "web" {
  name = yandex_compute_instance.platform.name
}
data "yandex_compute_instance" "db" {
  name = yandex_compute_instance.platformdb.name
}

output "default" {
    value = [
    data.yandex_compute_instance.web.network_interface.0.nat_ip_address, 
    data.yandex_compute_instance.db.network_interface.0.nat_ip_address,
    data.yandex_compute_instance.web.fqdn,
    data.yandex_compute_instance.db.fqdn,
    data.yandex_compute_instance.web.fqdn,
    data.yandex_compute_instance.db.fqdn,
    yandex_compute_instance.platform.name,
    yandex_compute_instance.platformdb.name,
    ]
}