terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.2"
    }
  }
}

provider "docker" {
}

resource "docker_network" "app_network" {
  name = "my_devops_network_${var.env_name}"
}

module "my_webserver" {
  source = "./modules/webserver"

  container_name = "web-app-${var.env_name}"
  image_name     = "nginx:${var.image_name}"
  external_port  = var.app_port

  network_name   = docker_network.app_network.name
}

resource "docker_container" "db" {
  name  = "db-${var.env_name}"
  image = "redis:alpine"

  networks_advanced {
    name = docker_network.app_network.name
  }
}
