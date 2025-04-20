# Terraform Required Version
terraform {  #Configures Terraform settings
  required_version = ">= 1.3.0"  #Ensures Terraform version is 1.3.0 or higher for compatibility
}

# AWS Provider
provider "aws" { 
  region = var.aws_region
}

# Variables (Define defaults)
variable "aws_region" {  #Declares a variable for the AWS region
  default = "eu-west-2"  #Sets default region to eu-west-2 (London)
}


# Node Instance Type
variable "node_instance_type" {  #Declares a variable for the node instance type
  default = "t3.medium"  #Sets default instance type to t3.medium (2 vCPUs, 4GB RAM)
}

# VPC Configuration
resource "aws_vpc" "devops_vpc" {  #Creates a VPC for the project
  cidr_block = "10.0.0.0/16"  #Sets VPC IP range to 10.0.0.0/16 (65,536 IPs)
  tags = {  #Adds metadata for identification
    Name = "devops-vpc"  #Labels the VPC as devops-vpc in AWS
  }


  # SUBNETS


  # SUBNET: eu-west-2a

  # Public Subnet 1 (eu-west-2a)
resource "aws_subnet" "public_subnet_1" {  #Creates a public subnet in eu-west-2a
  vpc_id                  = aws_vpc.devops_vpc.id  #Links to the devops_vpc
  cidr_block              = "10.0.1.0/24"  #Sets subnet IP range to 10.0.1.0/24 (256 IPs)
  map_public_ip_on_launch = true  #Enables public IP assignment for instances in this subnet
  availability_zone       = "eu-west-2a"  #Places subnet in eu-west-2a AZ
  tags = {  #Adds metadata for identification
    Name = "devops-public-subnet-1"  
  }
}

  # PRIVATE Subnet 1 (eu-west-2a)
resource "aws_subnet" "private_subnet_1" {  #Creates a public subnet in eu-west-2a
  vpc_id                  = aws_vpc.devops_vpc.id  #Links to the devops_vpc
  cidr_block              = "10.0.2.0/24"  #Sets subnet IP range to 10.0.1.0/24 (256 IPs)
  map_public_ip_on_launch = false  #set to false for private ip
  availability_zone       = "eu-west-2a"  #Places subnet in eu-west-2a AZ
  tags = {  #Adds metadata for identification
    Name = "devops-private-subnet-1" 
  }
}






  # SUBNET: eu-west-2b


# Public Subnet 2 (eu-west-2b)
resource "aws_subnet" "public_subnet_2" {  #Creates a public subnet in eu-west-2b
  vpc_id                  = aws_vpc.devops_vpc.id  #Links to the devops_vpc
  cidr_block              = "10.0.3.0/24"  #Sets subnet IP range to 10.0.2.0/24 (256 IPs)
  map_public_ip_on_launch = true  #Enables public IP assignment for instances in this subnet
  availability_zone       = "eu-west-2b"  #Places subnet in eu-west-2b AZ
  tags = {  #Adds metadata for identification
    Name = "devops-public-subnet-2"  
  }
}

# PRIVATE Subnet 2 (eu-west-2b)
resource "aws_subnet" "private_subnet_2" {  #Creates a public subnet in eu-west-2b
  vpc_id                  = aws_vpc.devops_vpc.id  #Links to the devops_vpc
  cidr_block              = "10.0.4.0/24"  #Sets subnet IP range to 10.0.2.0/24 (256 IPs)
  map_public_ip_on_launch = false  #set to false for private ip
  availability_zone       = "eu-west-2b"  #Places subnet in eu-west-2b AZ
  tags = {  #Adds metadata for identification
    Name = "devops-private-subnet-2"  
  }
}