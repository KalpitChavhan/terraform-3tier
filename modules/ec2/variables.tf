variable "name" {
  description = "Prefix for resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EC2 instances will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EC2 placement"
  type        = list(string)
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0dee22c13ea7a9a67" # Amazon Linux 2 for ap-south-1
}

variable "key_name" {
  description = "Existing AWS key pair name"
  type        = string
}

variable "public_key_path" {
  description = "Path to SSH public key (used to create key pair if none exists)"
  type        = string
}

variable "user_data" {
  description = "User data script content to bootstrap instances"
  type        = string
}

variable "create_in_public_subnet" {
  description = "Launch EC2 in public subnet for demo (instead of private)"
  type        = bool
  default     = true
}
