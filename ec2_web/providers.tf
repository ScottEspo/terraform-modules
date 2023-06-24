#https://registry.terraform.io/providers/hashicorp/aws/latest/docs

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " >= 4.57.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform-dev"
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform-dev"
  alias   = "use2"
}

# provider "aws-prod" {
#   region = "us-east-1"
#   profile = "terraform-demo-prod"
#   alias = "aws_prod"
# }