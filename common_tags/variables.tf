variable "name" {
    Description = "name of deployer"
    type = string
    default = "Anonymous :)"
}

variable "env" {
    Description = "environment"
    type = string
}
variable "project" {
    Description = "project name"
    type = string
}
variable "org" {
    Description = "Org code for billing"
    type = string
}
