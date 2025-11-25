output "container_id" {
  value = docker_container.box.id
}

output "ip_address" {
  value = docker_container.box.network_data[0].ip_address
}
