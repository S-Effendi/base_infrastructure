terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Create Virtual Private Cloud (VPC)
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}