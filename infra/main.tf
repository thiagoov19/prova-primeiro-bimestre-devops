module "vpc" {
  source               = "./modules/vpc"
  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security_groups" {
  source           = "./modules/security-group"
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  app_port         = var.app_port
}
