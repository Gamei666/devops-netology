module "vpc" {
  source = "./vpc"
  name = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = ["10.0.1.0/24"] },
    { zone = "ru-central1-b", cidr = ["10.0.2.0/24"] },
    { zone = "ru-central1-c", cidr = ["10.0.3.0/24"] },
    { zone = "ru-central1-d", cidr = ["10.0.4.0/24"] },
  ]
}

module "marketing" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "marketing"
  network_id     = module.vpc.result.network_id
  subnet_zones   = module.vpc.result.zone
  subnet_ids     = module.vpc.result.subnet_id
  instance_name  = "web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "analytics"
  network_id     = module.vpc.result.network_id
  subnet_zones   = module.vpc.result.zone
  subnet_ids     = module.vpc.result.subnet_id
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username       = var.username
    ssh_public_key = var.ssh 
    }
}

module "db_cluster" {
  source = "./mysql_cluster"
  name = "example"
  HA = true
  subnet_ids = module.vpc.result.subnet_id
  subnet_zone = module.vpc.result.zone
  network_id = module.vpc.result.network_id
}

module "db_config" {
  source = "./mysql_database"
  name = "app"
  password = var.dbpass
  cluster_id = module.db_cluster.cluster_id
  dbname = "test"
}
