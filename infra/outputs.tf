output "ec2_public_ip" {
  description = "IP publico da EC2"
  value       = module.ec2.public_ip
}

output "api_url" {
  description = "URL da API de Reservas"
  value       = "http://${module.ec2.public_ip}:${var.app_port}"
}

output "rds_endpoint" {
  description = "Endpoint do RDS PostgreSQL"
  value       = module.rds.endpoint
}
