variable "name" {
  description = "Prefix name for resources"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Create a NAT Gateway for private subnets (costly)"
  type        = bool
  default     = false

}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}
