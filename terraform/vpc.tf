
# Create the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "my-vpc"
  }
}

# Create the subnet
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "${var.region}a"
  tags = {
    Name = "my-subnet"
  }
}

# Create the internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Create the route table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "my-rt"
  }
}

# Associate the subnet with the route table
resource "aws_route_table_association" "my_rta" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_rt.id
}

# Assign a public IP to the subnet
resource "aws_eip" "my_eip" {
  vpc = true
}

resource "aws_network_interface" "my_eni" {
  subnet_id = aws_subnet.my_subnet.id
}

resource "aws_eip_association" "my_eip_assoc" {
  allocation_id        = aws_eip.my_eip.id
  network_interface_id = aws_network_interface.my_eni.id
}

