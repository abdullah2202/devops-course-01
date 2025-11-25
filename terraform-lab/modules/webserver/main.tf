terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.2"
    }
  }
}

resource "docker_image" "img" {
  name         = var.image_name
  keep_locally = false
}

resource "docker_container" "box" {
  image = docker_image.img.image_id
  name  = var.container_name

  ports {
    internal  = 80
    external = var.external_port
  }

  networks_advanced {
    name = var.network_name
  }
}
