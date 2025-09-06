variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "El bloque CIDR para la subred pública."
  type        = string
}