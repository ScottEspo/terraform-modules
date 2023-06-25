locals {
  tags = {
    Environment  = var.environment
    Project      = var.project
    OrgCode      = var.orgCode
    DeployedFrom = path.cwd
  }
}