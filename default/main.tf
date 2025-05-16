terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      environment = "test"
      managed_by  = "terraform"
      checkov_uid = "CKV_AWS_358"
    }
  }
}

# Checkov fails to keep track of resource relationships when 
# using modules and multiple instance of the same resource.
module "rds" {
  source = "./rds_module"
}
