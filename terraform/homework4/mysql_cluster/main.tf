resource "null_resource" "host_count" {
  count = var.HA == true ? 2 : 1 
}
resource "yandex_mdb_mysql_cluster" "db" {
  name        = var.name
  environment = "PRESTABLE"
  network_id  = var.network_id
  version     = "8.0"

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-ssd"
    disk_size          = 16
  }

  mysql_config = {
    sql_mode                      = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
    max_connections               = 100
    default_authentication_plugin = "MYSQL_NATIVE_PASSWORD"
    innodb_print_all_deadlocks    = true

  }
  dynamic "host" {
    for_each = null_resource.host_count
    content {
    zone = element(var.subnet_zone, 1)
    subnet_id = element(var.subnet_ids, 1)
  }
}
}