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
  region = "us-east-1"
}