terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~>4.0"
      }
    }
}

provider "aws" {
  region = "us-east-1"
  # Unsafe practice. Better to use the secrets only in CLI
  access_key = var.access_key
  secret_key = var.secret_key
}