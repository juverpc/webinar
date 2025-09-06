variable "vpc_id" {
  description = "El ID de la VPC donde se desplegará la instancia."
  type        = string
}

variable "public_subnet_id" {
  description = "El ID de la subred pública para la instancia."
  type        = string
}

variable "ami_id" {
  description = "El AMI para la instancia EC2."
  type        = string
}

variable "instance_type" {
  description = "El tipo de instancia EC2."
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "La región de AWS."
  type        = string
}