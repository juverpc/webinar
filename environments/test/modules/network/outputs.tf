output "vpc_id" {
  description = "El ID de la VPC creada."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "El ID de la subred pública creada."
  value       = aws_subnet.public.id
}