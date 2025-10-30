terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "kalpit-tfstate-demo"      # <-- replace with your bucket name
    key            = "terraform-3tier/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tfstate-locks"
  }
}

provider "aws" {
  region = "ap-south-1"
}
