# Create a subnet
resource "aws_subnet" "public_subnets" {
  count = "${length(var.public_subnet_prefix)}"
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "${var.public_subnet_prefix[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
    Name = "public-subnet-${var.subnet_suffix[count.index]}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = "${length(var.private_subnet_prefix)}"
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "${var.private_subnet_prefix[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
    Name = "private-subnet-${var.subnet_suffix[count.index]}"
  }
}

# Associate subnet with Route Table
resource "aws_route_table_association" "a" {
  count = "${length(var.public_subnets)}"
  subnet_id      = aws_subnet.public_subnets[*].id
  route_table_id = aws_route_table.prod-route-table.id
}