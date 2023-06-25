variable "name" {
  description = "name of deployer"
  type        = string
  default     = "Anonymous :)"
}
variable "environment" {
  description = "environment name"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "The environment must be \"dev\", \"test\", or \"prod\"."
  }
}
variable "project" {
  description = "project name"
  type        = string
}
variable "orgCode" {
  description = "Org code for billing"
  type        = string
}
