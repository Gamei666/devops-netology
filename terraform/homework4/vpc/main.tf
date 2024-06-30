resource "yandex_vpc_network" "develop" {
  name = var.name
}

resource "yandex_vpc_subnet" "develop" {
  for_each = { for develop in var.subnets : develop.zone => develop }
  name = "${var.name}-${each.key}"
  zone = each.value.zone
  network_id = yandex_vpc_network.develop.id
  v4_cidr_blocks = each.value.cidr
}