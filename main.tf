provider "aws" {
region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  instance_tenancy = "default"
  tags  = {
    Name =  "terra-vpc"
  } 
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terra-igw"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.0.0/24"

  tags = {
    Name = "Main"
  }
}
resource "aws_route_table_association" "rt_public1" {
    subnet_id = aws_subnet.public_main_us_east_1a.id
    route_table_id = aws_route_table.vpc.main_public.id
}