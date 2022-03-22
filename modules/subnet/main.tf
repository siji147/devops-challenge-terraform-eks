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

# Associate subnet with Route Table
resource "aws_route_table_association" "a" {
  count          = length(var.public_subnet_prefix)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = var.route_table_id
}
