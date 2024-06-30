output "result" {
    value = {
        network_id = yandex_vpc_network.develop.id
        subnet_id = values(yandex_vpc_subnet.develop).*.id
        zone = values(yandex_vpc_subnet.develop).*.zone
    } 
  
}