variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "hosted_zone_name" {
  default = "ballerszone.com.ng"
}

variable "subdomain_name" {
  default = "terraform-test"
}
