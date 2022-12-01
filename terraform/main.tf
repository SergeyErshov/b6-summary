module "yandex_instance_1" {
  source                = "./modules/create_vm"
  disk_size             = "15"
  instance_family_image = "ubuntu-2004-lts"
  instance_subnet_name  = "a-ru-central1-a"
  instance_name         = "vm1"
  zone_name             = "ru-central1-a"
}


module "yandex_instance_2" {
  source                = "./modules/create_vm"
  disk_size             = "10"
  instance_family_image = "ubuntu-2004-lts"
  instance_subnet_name  = "a-ru-central1-a"
  instance_name         = "vm2"
  zone_name             = "ru-central1-a"
}

module "yandex_instance_3" {
  source                = "./modules/create_vm"
  disk_size             = "10"
  instance_family_image = "centos-7"
  instance_subnet_name  = "a-ru-central1-a"
  instance_name         = "vm3"
  zone_name             = "ru-central1-a"
}
