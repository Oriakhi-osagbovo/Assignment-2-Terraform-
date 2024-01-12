terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "instances" {
  source = "./modules/instances"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  instance_count = 3
}

module "elb" {
  source = "./modules/elb"
  vpc_id = module.vpc.vpc_id
  instances = module.instances.instance_ids
}

module "dns" {
  source = "./modules/dnsroute53"
  hosted_zone_name = var.hosted_zone_name
  subdomain_name = var.subdomain_name
  elb_dns_name = module.elb.elb_dns_name
}
