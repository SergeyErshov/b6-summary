resource "yandex_compute_instance" "vm" {
  description        = "Creatind new instance with the name"
  name               = var.instance_name
  platform_id	     = "standard-v3"
  service_account_id = data.yandex_iam_service_account.user_id.id
  zone               = var.zone_name

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.img.id
      size     = var.disk_size	
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.subnet.id
    nat       = var.nat
  }

  metadata = {
    user-data          = "${file("/home/esm/ansible/playbooks/b6-summary/terraform/.metadata/yc_users.txt")}"
    serial-port-enable = 1
  }
}

# Получаем id требуемого образа

data "yandex_compute_image" "img" {
  family = var.instance_family_image
}

#Получаем id подсети для инстанса

data "yandex_vpc_subnet" "subnet" {
  name = var.instance_subnet_name
}

# Получаем id сервисного аккаунта

data "yandex_iam_service_account" "user_id" {
  name = "esm"
}

