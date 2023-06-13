variable "vpc_count" {
  description = "Number of VPCs to create"
  default     = 1
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  for_each        = { for v in toset(range(var.vpc_count)) : tostring(v) => v }
  cidr_block      = cidrsubnet("10.0.0.0/16", 4, each.key)
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "main" {
  for_each = aws_vpc.main
  vpc_id   = aws_vpc.main[each.key].id
}

resource "aws_subnet" "public" {
  for_each          = { for k, v in data.aws_availability_zones.available.names : k => v if k < 3 }
  vpc_id            = aws_vpc.main[0].id
  cidr_block        = cidrsubnet("10.0.0.0/24", 8, each.key)
  availability_zone = each.value
}

resource "aws_subnet" "private" {
  for_each          = { for k, v in data.aws_availability_zones.available.names : k => v if k < 3 }
  vpc_id            = aws_vpc.main[0].id
  cidr_block        = cidrsubnet("10.0.1.0/21", 8, each.key)
  availability_zone = each.value
}

resource "aws_nat_gateway" "nat" {
  for_each         = aws_subnet.public
  subnet_id        = each.value.id
  allocation_id    = aws_eip.nat[each.key].id
}

resource "aws_eip" "nat" {
  for_each = aws_subnet.public
  vpc      = true
}

output "vpc_ids" {
  value = keys(aws_vpc.main)
}

output "public_subnet_ids" {
  value = keys(aws_subnet.public)
}

output "private_subnet_ids" {
  value = keys(aws_subnet.private)
}