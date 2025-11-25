variable "env_name" {
  description = "The environment name (dev, prod)"
  type        = string
}

variable "app_port" {
  description = "Port to expose to the host"
  type        = number
}

variable "image_version" {
  description = "Tag of the Docker image"
  type        = string
  default     = "latest"
}
