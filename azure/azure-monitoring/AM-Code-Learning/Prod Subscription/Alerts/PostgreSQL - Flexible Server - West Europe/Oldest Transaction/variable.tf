variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_db_id" {

}

variable "threshold" {
  type = number
  default = 18000
}

variable "operator" {
    type = string
  default = "GreaterThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Maximum"
}

variable "severity" {
  type = number
  default = 1
}

variable "metric_name"{
    type = string
    default = "longest_transaction_time_sec"
}

variable "postgreSQL" {
  type = map(any)
  default = {
    postgreSQL = [
     {
     PostgreSQL_name = "pdweidmcredbpgsql002",
     resource_group_name = "PD-WE-IDMCRE-RG-001"
    },

    {
     PostgreSQL_name = "pdweusdbpgsql002",
     resource_group_name ="PD-WE-USDB-RG-001"
    },

    {
     PostgreSQL_name = "pdweusilpgsql002",
     resource_group_name = "PD-WE-USIL-RG-001"
    }
    ]
  }
}
