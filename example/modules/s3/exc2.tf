terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  for_each = var.ec2s
  ami           = each.value["ami"] 
  instance_type = each.value["instancetype"] 
  tags     = each.value["tags"]
}

