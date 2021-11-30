# Create VPC
# terraform aws create vpc

resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "demo-VPC"
  }
}


# Create Public Subnet_eu_west_1a 
# terraform aws create subnet
resource "aws_subnet" "public_subnet_eu_west_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet_eu_west_1a"
  }
}


# Create Public Subnet_eu-west-1b 
# terraform aws create subnet
resource "aws_subnet" "public_subnet_eu_west_1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet_eu_west_1b"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "demo_IGW"
  }
}

# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id
  }

  tags = {
    Name = "Public Subnets Route Table for My VPC"
  }
}

# Associate Public Subnet  to "Public Route Table"
# terraform aws associate subnet with route table

resource "aws_route_table_association" "public_subnet_route_table_association_1a" {
  subnet_id      = aws_subnet.public_subnet_eu_west_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_route_table_association_1b" {
  subnet_id      = aws_subnet.public_subnet_eu_west_1b.id
  route_table_id = aws_route_table.public_route_table.id
}

