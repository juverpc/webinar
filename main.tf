provider "aws" {
	region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-bucket-juver" 
    key            = "environment/test/terraform.tfstate"  
    region         = "us-east-1"  
    encrypt        = true  # Habilita la encriptación del estado
    dynamodb_table = "terraform-locks"  # Tabla DynamoDB para el bloqueo de estado
  }
}