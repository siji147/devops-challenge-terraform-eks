# Create a subnet
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_prefix)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_prefix[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${var.subnet_suffix[count.index]}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_prefix)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_prefix[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "private-subnet-${var.subnet_suffix[count.index]}"
  }
}

output "public_subnets" {
  value = aws_subnet.public_subnets
}

output "private_subnets" {
  value = aws_subnet.private_subnets
}

# Associate public subnet with Route Table
resource "aws_route_table_association" "a" {
  count          = length(var.public_subnet_prefix)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = var.route_table_id
}

# Create NAT Gateway for private subnet to access internet
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.igw]
}


# Assign an elastic IP

resource "aws_eip" "eip" {
  vpc                       = true
}

# Associate private subnet with Route Table
resource "aws_route_table_association" "b" {
  count          = length(var.private_subnet_prefix)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

# Create Route Table for private subnet

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  

  tags = {
    Name = "private_subnet_route_table"
  }
}