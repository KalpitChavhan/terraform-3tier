module "vpc" {
  source        = "./modules/vpc"
  name          = "kalpit-3tier"
  cidr_block    = "10.10.0.0/16"
  public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnets = ["10.10.101.0/24", "10.10.102.0/24"]
  enable_nat_gateway = false
  aws_region = "ap-south-1"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}


# Load the user_data script content
locals {
  user_data = file("${path.module}/user_data.sh")
}

module "ec2" {
  source                = "./modules/ec2"
  name                  = "kalpit-3tier"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.public_subnet_ids    # for demo, using public
  instance_type         = "t2.micro"
  key_name              = "kalpit-key"                    # replace with your key pair name
  public_key_path       = "/home/Kalpit/.ssh/id_rsa.pub"
  user_data             = local.user_data
  create_in_public_subnet = true
}

output "ec2_private_ip" {
  value = module.ec2.private_ip
}

module "rds" {
  source             = "./modules/rds"
  name               = "kalpit-3tier"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_id          = module.ec2.security_group_id

  db_username        = "admin"
  db_password        = "Terraform123"   # Simple, clean password — no symbols
}

module "alb" {
  source            = "./modules/alb"
  name              = "kalpit-3tier"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  ec2_instance_id   = module.ec2.instance_id
}

