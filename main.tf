terraform {
    cloud {
    organization = "y00rhighness-mtc-terransible"

    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}