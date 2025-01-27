variable "action_group_name" {
  type = string
  default = "AG-AM-Hub-Subscription-APPS"
}
variable "short_name" {
  type = string
  default = "AG-AM-Hub"
}

variable "rg_name" {
  type = string
 
}

variable "email_reciever" {
  default = [
    {
    email_address= "hcl_icheques_appsupport_l2@hcltech.com",
    email_name = "HCL_iCheques_appsupport_L2"
  }
  ]
}