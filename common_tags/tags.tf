locals {
tags = {
  Name = var.name
  Environment = var.env
  Project = var.project
  OrgCode = var.org
  DeployedFrom = path.cwd
  }
}