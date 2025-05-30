provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "forterraform1503"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-2"
      
    }
  }

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}


data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}