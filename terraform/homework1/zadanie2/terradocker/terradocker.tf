terraform {
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "~> 3.0.1"
    }
    }
}

provider "docker" {
  host     = "ssh://mamahnin@84.252.128.249:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-i", "/home/mamahnin/yandexcloud_rsa" ]
}

resource "random_password" "password" {
  count = 2
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name = "mysql:8"
  keep_locally = true
}

resource "docker_container" "wordpress_db" {
    image = docker_image.mysql.image_id
    name = "wordpress_db"
    tty = true
    
    ports {
        internal = 3306
        external = 3306
    }
    
    env = [
        "MYSQL_ROOT_PASSWORD=${random_password.password[0].result}",
        "MYSQL_DATABASE=wordpress",
        "MYSQL_USER=wordpress",
        "MYSQL_PASSWORD=${random_password.password[1].result}",
        "MYSQL_ROOT_HOST=%",
    ]
}

