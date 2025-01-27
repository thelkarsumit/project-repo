variable "action_group_id" {
  description = "Action Group Id"
}
variable "rg_name" {
}
variable "category" {
    type = string
  default = "ResourceHealth"
}
variable "description" {
    type = string
  default = "Resource Health Alert"
}
variable "trafficmanagerprofile" {
   default = ["Citrix-apac","CTS","cts-hclchequesutility-com","CTS-UAT","epcidm-eu","epcidm-eu-hclchequesutility-com","gis-apac-india-hclchequesutility-com","iclearing-apac","iclearing-apac-hclchequesutility-com","icollect-apac-callback-hclchequesutility-com","icollect-apac-hclchequesutility-com","SFTP-APAC","SFTP-APAC-TEST","SFTP-DEV-APAC","SFTP-DEV-US","SFTP-POC","SFTP-TM","SFTP-TM-TEST","usdisb-eu","usdisb-eu-hclchequesutility-com"]
 }
variable "trafficmanagerrgname" {
   default = ["HUB-CI-CITRIX-RG-001","PRD-CI-CTS-RG-001","PRD-CI-CTS-RG-001","DEV-CI-CTS-RG-001","PD-NE-SFTP-RG-001","PD-NE-SFTP-RG-001","PRD-CI-GIS-RG-001","HUB-CI-CITRIX-RG-001","PD-CI-iClear-RG-001","PD-CI-ICOLLECT-RG-01","PRD-CI-CTS-RG-001","pd-ci-sftp-rg","PD-CI-SFTP-RG","hub-ci-sftp-nrg-001","HUB-NE-SFTP-NRG-001","POC-WE-SFTP-RG-001","pd-ne-sftp-rg-001","PD-NE-SFTP-RG-001","PD-NE-USDB-RG-001","PD-NE-USDB-RG-001"]

 }
