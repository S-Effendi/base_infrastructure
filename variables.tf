variable "region" {
  description = "AWS region"
  default     = "af-south-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}
