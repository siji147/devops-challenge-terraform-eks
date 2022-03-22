provider "aws" {
  region     = "us-west-2"
}


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
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Prod"
  }
}

# Use the created modules to deploy subnets
module "subnet_module" {
    source = "./modules/challenge-2"
}



