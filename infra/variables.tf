variable "aws_region" {
  description = "Regiao da AWS (Learner Lab usa us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "prova-reservas"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "allowed_ssh_cidr" {
  description = "CIDR com SSH liberado (restrinja ao seu IP: x.x.x.x/32)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "app_port" {
  description = "Porta publicada pela API no docker-compose"
  type        = number
  default     = 3000
}
