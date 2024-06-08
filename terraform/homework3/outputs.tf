output "ip" {
  value = {
    for i in yandex_compute_instance.db:
    "name" => i.name
  }
}