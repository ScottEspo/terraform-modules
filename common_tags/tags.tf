locals {
tags = {
  Environment = var.env
  Project = var.project
  OrgCode = var.orgCode
  DeployedFrom = path.cwd
  }
}