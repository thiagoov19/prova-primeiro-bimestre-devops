provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "prova-reservas"
      ManagedBy = "terraform"
      Owner     = "thiago"
    }
  }
}
