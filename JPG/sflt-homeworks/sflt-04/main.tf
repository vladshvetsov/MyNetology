terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yandex_cloud_api_token
  cloud_id  = "b1gvibjotoc6e7f5j8a5"
  folder_id = "b1gfr53gu9f2vbflut6n"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm" {
    count = 2
  name = "vm${count.index}"
  platform_id = "standard-v2"
  resources {
    core_fraction = 5
    cores         = 2
    memory        = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd81mpc969gbg44vndkv"
      size     = 10
    }
  }
   network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id 
    nat       = true
  }
   metadata = {
    user-data = "${file("./meta.txt")}"
  }
} 
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}
resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
resource "yandex_lb_network_load_balancer" "lb-1" {
  name = "lb-1"
  listener {
    name = "my-lb1"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.test-1.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
resource "yandex_lb_target_group" "test-1" {
  name        = "test-1"
  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm[0].network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm[1].network_interface.0.ip_address
  }
}
output "internal_ip_address_vm0" {
  value = yandex_compute_instance.vm[0].network_interface.0.ip_address
}
output "external_ip_address_vm0" {
  value = yandex_compute_instance.vm[0].network_interface.0.nat_ip_address
}
output "internal_ip_address_vm1" {
  value = yandex_compute_instance.vm[1].network_interface.0.ip_address
}
output "external_ip_address_vm1" {
  value = yandex_compute_instance.vm[1].network_interface.0.nat_ip_address
}  