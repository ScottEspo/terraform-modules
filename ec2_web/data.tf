data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

data "aws_route53_zone" "selected" {
  name         = var.hosted_zone
  private_zone = false
}

data "aws_subnets" "internal_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnet" "subnet_ids" {
  for_each = toset(data.aws_subnets.internal_subnets.ids)
  id       = each.value
}