resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name = "project_vpc"
  }
}

resource "aws_subnet" "project_public_subnet" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = "10.0.1.0/24"
  

  tags = {
    Name = "project_public_subnet"
  }
}


resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "project_igw"
  }
}


resource "aws_route_table" "project_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }

  tags = {
    Name = "projectt_rt"
  }
}


resource "aws_route" "project_routetointernet" {
  route_table_id            = aws_route_table.project_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.project_igw.id
}


resource "aws_route_table_association" "project_pub_association" {
  subnet_id      = aws_subnet.project_public_subnet.id
  route_table_id = aws_route_table.project_rt.id
}