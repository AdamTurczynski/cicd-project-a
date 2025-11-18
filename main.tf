terraform {
  required_version = "~> 1.13.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "demo-vpc-${terraform.workspace}"
    ManagedBy = "terraform"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}