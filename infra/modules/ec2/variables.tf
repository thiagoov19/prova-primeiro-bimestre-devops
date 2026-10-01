variable "project_name" {
  type = string
}

variable "public_subnet_id" {
  description = "Subnet publica onde a EC2 sera criada"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security Group da EC2"
  type        = string
}

variable "app_port" {
  type = number
}

variable "key_name" {
  description = "Key pair do Learner Lab"
  type        = string
  default     = "vockey"
}

variable "repo_url" {
  description = "Repositorio publico com a API"
  type        = string
  default     = "https://github.com/thiagoov19/prova-primeiro-bimestre-devops.git"
}
