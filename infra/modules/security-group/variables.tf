variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR com permissao de SSH"
  type        = string
}

variable "app_port" {
  description = "Porta publica da API"
  type        = number
}
