variable "vault_name" {
  description = "The name of the AWS Backup vault"
  type        = string 
}

variable "schedule" {
  description = "Cron expression for when to run backup plan"
  type        = string
}

variable "start_window" {
  default     = 60
  description = "The start window in minutes for the backup plan"
  type        = number
}

variable "completion_window" {
  default     = 180
  description = "The completion window in minutes for the backup plan"
  type        = number
}

variable "backups_expire_days" {
  description = "Days after the backups are deleted"
  type        = number
}

variable "min_retention_days" {
  description = "Minimum allowed retention days allowed by the vault lock."
  type        = number
}

variable "max_retention_days" {
  description = "Maximum allowed retention days allowed by the vault lock."
  type        = number
}

variable "backup_tag" {
  description = "The key of the tag to use on AWS resources that should be backed up."
  type        = string
}
