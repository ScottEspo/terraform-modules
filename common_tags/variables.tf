variable "name" {
    Description = "name of deployer"
    type = string
    default = "Anonymous :)"
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
    Description = "project name"
    type = string
}
variable "orgCode" {
    Description = "Org code for billing"
    type = string
}
