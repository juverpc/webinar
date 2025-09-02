# Recurso para el grupo de seguridad
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Permite trafico web y SSH."
  vpc_id      = var.vpc_id

  # Regla para el tráfico HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla para el tráfico SSH (opcional, pero útil)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla para el tráfico saliente
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Script de usuario para instalar Apache
data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
  vars = {
    region = var.region
  }
}

# Recurso para la instancia EC2
resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data_base64 = base64encode(data.template_file.user_data.rendered)

  tags = {
    Name = "test-web-server"
  }
}