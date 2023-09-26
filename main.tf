terraform {
  cloud {
    organization = "y00rhighness-mtc-terransible"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17.0"
    }
  }
}


provider "aws" {
  # Configuration options
  region = "us-west-2"
}

provider "random" {
  # Configuration options
}


#
# https://registry.terraform.io/providers/hashicorp/random/latest
#
resource "random_string" "bucket_name" {
  length = 32
  lower = true
  upper = false
  special = false
}

#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
#
# https://docs.aws.amazon.com/console/s3/bucket-naming
#
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


output "random_bucket_name" {
  value = random_string.bucket_name.result
}
