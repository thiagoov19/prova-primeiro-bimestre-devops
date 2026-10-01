variable "project_name" {
  type = string
}

variable "private_subnet_ids" {
  description = "Subnets privadas do DB subnet group"
  type        = list(string)
}

variable "rds_sg_id" {
  description = "Security Group do RDS"
  type        = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}
