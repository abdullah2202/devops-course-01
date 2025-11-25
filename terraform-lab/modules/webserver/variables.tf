variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "image_name" {
  description = "The Docker image to use"
  type        = string
  default     = "nginx:latest"
}

variable "external_port" {
  description = "The port the machine listens on"
  type        = number
  default     = 8080
}

variable "network_name" {
  description = "The network to attach to"
  type        = string
}
