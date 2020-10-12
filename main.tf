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
