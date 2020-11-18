# Designate a cloud provider, region, and credentials
provider "aws" {
  access_key = "<Access key to be replaced>"
  secret_key = "<Secret key to be replaced>"
  region =  "us-east-1"
}

variable "public_subnet" {
  type = string
  default = "subnet-c5e955a3"
}


# Provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {
  count = "4"
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  tags = {
    Name = "Udacity project 2"
  }
  subnet_id = var.public_subnet
}


#Provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "Udacity_M4" {
  count = "2"
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "m4.large"
  tags = {
    Name = "Udacity project 2"
  }
  subnet_id = var.public_subnet
}
