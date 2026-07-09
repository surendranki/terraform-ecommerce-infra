terraform {
  backend "s3" {
    bucket         = "surendran-terraform-state-bucket"
    key            = "ecommerce-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "web_server" {
  source = "./modules/web-server"

  project_name  = var.project_name
  environment   = var.environment
  instance_type = var.instance_type
  ami_id        = var.ami_id
}