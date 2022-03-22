# Create VPC

resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "plan-a-vpc"
  }
}

# Create Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id
}

# Create Custom Route Table

resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_subnet_route_table"
  }
}

output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.prod-vpc.id
}

output "route_table_id" {
  description = "The Route Table ID"
  value       = aws_route_table.prod-route-table.id
}
