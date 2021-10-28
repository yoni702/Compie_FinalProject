# Internet VPC
resource "aws_vpc" "masteroll" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "masteroll"
  }
}

# Subnets
resource "aws_subnet" "masteroll-public-1" {
  vpc_id                  = aws_vpc.masteroll.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "masteroll-public-1"
  }
}

resource "aws_subnet" "masteroll-public-2" {
  vpc_id                  = aws_vpc.masteroll.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "masteroll-public-2"
  }
}


resource "aws_subnet" "masteroll-private-1" {
  vpc_id                  = aws_vpc.masteroll.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "masteroll-private-1"
  }
}
resource "aws_subnet" "masteroll-private-2" {
  vpc_id                  = aws_vpc.masteroll.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "masteroll-private-2"
  }
}

# Internet GW
resource "aws_internet_gateway" "masteroll-gw" {
  vpc_id = aws_vpc.masteroll.id

  tags = {
    Name = "masteroll"
  }
}

# route tables
resource "aws_route_table" "masteroll-public" {
  vpc_id = aws_vpc.masteroll.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.masteroll-gw.id
  }

  tags = {
    Name = "masteroll-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "masteroll-public-1-a" {
  subnet_id      = aws_subnet.masteroll-public-1.id
  route_table_id = aws_route_table.masteroll-public.id
}

resource "aws_route_table_association" "masteroll-public-2-a" {
  subnet_id      = aws_subnet.masteroll-public-2.id
  route_table_id = aws_route_table.masteroll-public.id
}



