variable "hosted_zone" {
    description = "Hosted Zone where you want to your new site to live"
    type = string
}

variable "instance_type" {
    description = "instance type for your ec2 instance"
    type = string
    default = "t2.micro"  
}

variable "environment" {
  description = "environment name"
  type = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.test_variable)
    error_message = "The environment must be \"dev\", \"test\", or \"prod\"."
  }
}

variable "project" {
  
}

variable "OrgCode" {
  
}

variable "vpc_id" {
  
}
