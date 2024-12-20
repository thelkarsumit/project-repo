# variable "action_group_id" {
#   description = "Action Group Id"
# }

# variable "rg_name" {
# }

# variable "metric_name" {
#   default = "deadlocks"
# }

# variable "operator" {
#   default = "GreaterThan"
# }

# variable "time_aggregation_method" {
#   default = "Total"
# }

# variable "metric_alert" {
#   type = map(object({
#     postgreSQL_name = string
#     rg_name = string
#     severity = number
#     threshold = number

#   }))

#   default = {

#     pdciicollectdbpgsql01-Error = {
#       postgreSQL_name = "pdciicollectdbpgsql01"
#       rg_name = "PD-CI-ICOLLECT-RG-01"
#       severity = 1
#       threshold = 0
#     }
    
#     # pdneidmcredbpgsql001-Warning= {
#     #   postgreSQL_name = "pdneidmcredbpgsql001"
#     #   rg_name = "PD-NE-POSTGRE-PAAS-001"
#     #   severity = 2
#     #   threshold = 0
#     # }

#     # pdneidmcredbpgsql001-Error= {
#     #   postgreSQL_name = "pdneidmcredbpgsql001"
#     #   rg_name = "PD-NE-POSTGRE-PAAS-001"
#     #   severity = 1
#     #   threshold = 0
#     # }
#     }
#   }