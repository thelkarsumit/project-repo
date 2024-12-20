variable "action_group_name" {
  type = string
  default = "AG-AM-Dev-Subscription"
}
variable "short_name" {
  type = string
  default = "AG-AM-Dev"
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
    email_address= "DL-CLOUD-DB-CHEQUE@hcltech.com",
    email_name = "DL-Cloud-DB-CHEQUE"
  }
  ]
}