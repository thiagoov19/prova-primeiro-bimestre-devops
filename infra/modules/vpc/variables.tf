variable "project_name" {
  description = "Prefixo usado nos nomes dos recursos"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDRs das subnets publicas (uma por AZ)"
  type        = list(string)
}
