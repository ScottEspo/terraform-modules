locals {
tags = {
  Environment = var.env
  Project = var.project
  OrgCode = var.org
  DeployedFrom = path.cwd
  }
}