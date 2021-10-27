# Internet VPC
resource "aws_vpc" "partb" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "partb"
  }
}

# Subnets
resource "aws_subnet" "partb-public-1" {
  vpc_id                  = aws_vpc.partb.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "partb-public-1"
  }
}

resource "aws_subnet" "partb-public-2" {
  vpc_id                  = aws_vpc.partb.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "partb-public-2"
  }
}

resource "aws_subnet" "partb-private-1" {
  vpc_id                  = aws_vpc.partb.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "partb-private-1"
  }
}

resource "aws_subnet" "partb-private-2" {
  vpc_id                  = aws_vpc.partb.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "partb-private-2"
  }
}


# Internet GW
resource "aws_internet_gateway" "partb-gw" {
  vpc_id = aws_vpc.partb.id

  tags = {
    Name = "partb"
  }
}

# route tables
resource "aws_route_table" "partb-public" {
  vpc_id = aws_vpc.partb.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.partb-gw.id
  }

  tags = {
    Name = "partb-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "partb-public-1-a" {
  subnet_id      = aws_subnet.partb-public-1.id
  route_table_id = aws_route_table.partb-public.id
}

resource "aws_route_table_association" "partb-public-2-a" {
  subnet_id      = aws_subnet.partb-public-2.id
  route_table_id = aws_route_table.partb-public.id
}

