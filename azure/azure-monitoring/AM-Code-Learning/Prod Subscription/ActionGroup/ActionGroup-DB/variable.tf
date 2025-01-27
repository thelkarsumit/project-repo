variable "action_group_name" {
  type = string
  default = "AG-AM-Prod-Subscription-DB"
}
variable "short_name" {
  type = string
  default = "AG-AM-Prod"
}

variable "rg_name" {
  type = string
 
}

variable "email_reciever" {
  default = [
    {
    email_address= "DBCInfraMgmt@hcltech.com",
    email_name = "DBCInfraMgmt"
  },
   {
    email_address= "DL-DBA-DBCHEQUE@hcltech.com",
    email_name = "DL-DBA-DBCHEQUE"
  }
  ]
}