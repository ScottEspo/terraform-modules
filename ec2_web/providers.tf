#https://registry.terraform.io/providers/hashicorp/aws/latest/docs

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " >= 4.57.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "3.26.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = var.profile
}

provider "aws" {
  region  = "us-east-1"
  profile = var.prod_profile
  alias   = "aws_prod"
}

provider "aws" {
  region  = "us-east-1"
  profile = var.dev_profile
  alias   = "aws_dev"
}

# provider "aws-prod" {
#   region = "us-east-1"
#   profile = "terraform-demo-prod"
#   alias = "aws_prod"
# }

provider "datadog" {
  api_key = "1d5d25aa319c0aba8d249a8b3f94afd3"
  app_key = "0be60fc47a9f7e6a0e0361b020f42de6668a46b0"

}