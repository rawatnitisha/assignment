provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source    = "./modules/vpc"
  vpc_count = var.vpc_count
}