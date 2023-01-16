terraform {
  backend "s3" {
    bucket         = "backend-bucket"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }

  required_version = "~> 1.1.8"
}


module "backup-eu-central-1" {
  source = "./backup"

  vault_name = "backup-vault"
  schedule = "cron(0 2 * * ? *)"
  
  min_retention_days = 1    # Can not be changed after apply!
  max_retention_days = 100  # Can not be changed after apply!

  backups_expire_days = 7   # Must be between 'min_retention_days' & 'min_retention_days'

  backup_tag = "immutable-backup"
}