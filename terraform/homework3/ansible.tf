resource "local_file" "ansible_inventory" {
  filename = "./asnible_inv"
  content  = templatefile("${path.module}/ansible_inv_template.tftpl", 
  {
    webservers = yandex_compute_instance.web,
    databases = yandex_compute_instance.db,
    storages = local.storagelist,
  })
}