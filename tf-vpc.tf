# Vpc
resource "aws_vpc" "primary" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "primary"
    Env  = "Dev"
  }
}

# Subnet - Public
resource "aws_subnet" "public_Subnet" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "10.0.0.0/17"
  map_public_ip_on_launch = true

  tags = {
    Name = "Primary-Public-Subnet"
    Env  = "Dev"
  }
}

# Subnet - Private
resource "aws_subnet" "private_Subnet" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = "10.0.128.0/17"

  tags = {
    Name = "Primary-Private-Subnet"
    Env  = "Dev"
  }
}

# IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.primary.id

  tags = {
    Name = "Primary-IGW"
    Env  = "Dev"
  }
}

# RTB
resource "aws_route_table" "Primary_Rtb" {
  vpc_id = aws_vpc.primary.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Primary-Rtb"
    Env  = "Dev"
  }
}


resource "aws_route_table_association" "Primary_Rtb_assoc" {
  subnet_id      = aws_subnet.public_Subnet.id
  route_table_id = aws_route_table.Primary_Rtb.id
}