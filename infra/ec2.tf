module "ec2" {
  source           = "./modules/ec2"
  project_name     = var.project_name
  public_subnet_id = module.vpc.public_subnet_ids[0]
  ec2_sg_id        = module.security_groups.ec2_sg_id
  app_port         = var.app_port
  db_host          = module.rds.endpoint
  db_port          = module.rds.port
  db_name          = var.db_name
  db_username      = var.db_username
  db_password      = var.db_password
}
