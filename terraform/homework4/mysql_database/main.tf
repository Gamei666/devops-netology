resource "yandex_mdb_mysql_database" "testdb" {
  cluster_id = var.cluster_id
  name       = var.dbname
}

resource "yandex_mdb_mysql_user" "test" {
	cluster_id = var.cluster_id
    name       = var.name
    password   = var.password

    permission {
      database_name = var.dbname
      roles         = ["ALL"]
    }
    
	global_permissions = ["PROCESS"]

	authentication_plugin = "SHA256_PASSWORD"
}