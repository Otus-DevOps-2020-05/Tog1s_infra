output "external_ip_address_app-1" {
  value = yandex_compute_instance.app[0].network_interface.0.nat_ip_address
}
output "external_ip_address_app-2" {
  value = yandex_compute_instance.app[1].network_interface.0.nat_ip_address
}
output "internal_ip_adress_app-1" {
  value = yandex_compute_instance.app[0].network_interface.0.ip_address
}
output "internal_ip_adress_app-2" {
  value = yandex_compute_instance.app[1].network_interface.0.ip_address
}
