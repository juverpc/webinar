provider "aws" {
	region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-bucket-juver"
    key            = "environments/test/terraform.tfstate"
    region         = "us-east-1"               # Cambia por tu región
    dynamodb_table = "terraform-locks"         # Opcional pero recomendado para lock
    encrypt        = true
  }
}


# Llama al módulo de red
module "network" {
  source = "modules/network"

  vpc_cidr         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

# Llama al módulo de EC2
module "webserver" {
  source = "modules/ec2"

  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_id
  ami_id           = "ami-0fd3ac4abb734302a" # AMI de Ubuntu 22.04 en us-east-1
  instance_type    = "t2.micro"
  region           = "us-east-1"
}

# Salida de la IP pública
output "webserver_ip" {
  value = module.webserver.public_ip
}