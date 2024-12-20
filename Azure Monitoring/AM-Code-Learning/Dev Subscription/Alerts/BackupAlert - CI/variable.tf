variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {
  description = "Action Group Id"
}

variable "description" {
    type = string
    default = "The count of health events pertaining to backup job health"
}

variable "metric_name" {
  default = "BackupHealthEvent"
}

variable "threshold" {
  type = number
  default = 0
}

variable "operator" {
    type = string
  default = "GreaterThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Count"
}

variable "severity" {
  type = number
  default = 0
}

variable "recovery_rg_names" {
  default = ["DEV-CI-AZBACKUP-001", "dev-ci-sql-paas-001"]
}

variable "recovery_service_vault_names" {
  default = ["RECSRVVault-DEV-CI-AZBACKUP-001", "vault-lsopnmx2"]
}