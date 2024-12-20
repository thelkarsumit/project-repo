variable "rg_name" {
  default = "RG-AM-Hub-Subscription"
}
variable "virtual-machines" {
  type = map(any)
  default = {
    vms = [{
      vm_name = "PDCISFTP001",
      resource_group_name ="HUB-CI-MITIGATION-RG-001",
      os_type = "windows"
    
    },
    {
      vm_name = "PDNESFTP001",
      resource_group_name ="PD-NE-SFTP-NRG-001",
      os_type = "windows"
    },
    {
      vm_name = "PDNEIDM001",
      resource_group_name ="PD-NE-SFTP-NRG-001",
      os_type = "windows"
    
    },
    {
      vm_name = "PDCICTS001",
      resource_group_name ="HUB-CI-MITIGATION-RG-001",
      os_type = "windows"
    
    },
    {
      vm_name = "pdcielk001",
      resource_group_name ="PD-CI-ELK-RG-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdciilmon001",
      resource_group_name ="PD-CI-ELK-RG-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdciapphwa002",
      resource_group_name ="PRD-CI-HWA-RG-001",
      os_type = "linux"
    
    },
    # {
    #   vm_name = "pdcidbhwa002",
    #   resource_group_name ="PRD-CI-HWA-RG-001",
    #   os_type = "linux"
    
    # },
    {
      vm_name = "pdneelk001",
      resource_group_name ="PD-NE-ELK-RG-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdciaksjump001",
      resource_group_name ="pd-ci-aks-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdneaksjump001",
      resource_group_name ="pd-ne-aks-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdciicollect01",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "linux"
    
    },
    {
      vm_name = "pdciicollect02",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "linux"
    
    },
    {
      vm_name = "pdciicollectwin01",
      resource_group_name ="hub-ci-mitigation-rg-001",
      os_type = "windows"
    
    },
    #pahse 3 vms
    {
      vm_name = "hubciavdedp-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-edep",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavdedp-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-edep",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavdl2-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-l2",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavdops-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-ops",
      os_type = "windows"
    
    },
    {
      vm_name = "hubsiavdinf-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-infra",
      os_type = "windows"
    
    },
    {
      vm_name = "devciaksjump001",
      resource_group_name ="dev-ci-aks-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "devciansible001",
      resource_group_name ="hub-ci-ansible-nrg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "hubsiavdops-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-ops",
      os_type = "windows"
    
    },
    {
      vm_name = "PDCIAVD-1",
      resource_group_name ="pd-ci-avd-rg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "DEVCIDBSQL001",
      resource_group_name ="dev-ci-coll-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "DEVCIDBSQL002",
      resource_group_name ="dev-ci-coll-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "DEVCIDBSQL003",
      resource_group_name ="dev-ci-edepositsql-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "PDCIAVD-2",
      resource_group_name ="pd-ci-avd-rg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "PDCIINFAVD-0",
      resource_group_name ="pd-ci-avd-rg-003",
      os_type = "windows"
    
    },
    {
      vm_name = "PDCIL2AVD-0",
      resource_group_name ="pd-ci-avd-rg-002",
      os_type = "windows"
    
    },
    {
      vm_name = "devcihwa001",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "linux"
    
    },
    
    {
      vm_name = "devciicollect001",
      resource_group_name ="dev-ci-icollect-rg-001",
      os_type = "linux"
    
    },
    
     {
      vm_name = "devciicollect002",
      resource_group_name ="dev-ci-icollect-rg-001",
      os_type = "linux"
    
    },
    
    {
      vm_name = "devcijasper001",
      resource_group_name ="dev-ci-iclear-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "devcijenkins001",
      resource_group_name ="hub-ci-jenkins-001",
      os_type = "linux"
    
    },
    {
      vm_name = "devciwildfly001",
      resource_group_name ="dev-ci-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "PDSIAVD-0",
      resource_group_name ="pd-si-avd-rg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "PDSIAVD-1",
      resource_group_name ="pd-si-avd-rg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "devneelk001",
      resource_group_name ="ne-rg-corenetwork-001",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBCIAD001",
      resource_group_name ="hub-ci-ad-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBCIAD002",
      resource_group_name ="hub-ci-mitigation-rg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBCIAD003",
      resource_group_name ="hub-ci-mitigation-rg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBCIADCON001",
      resource_group_name ="hub-ci-adcon-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBCIANSIBLE001",
      resource_group_name ="hub-ci-ansible-nrg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "hubciavddev-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-devl3",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavddev-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-devl3",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavddev-2",
      resource_group_name ="rg-cin-prod-avd-mgmt-devl3",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavdinf-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-infra",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavdinf-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-infra",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavdl2-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-l2",
      os_type = "windows"
    
    },
    {
      vm_name = "hubciavdops-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-ops",
      os_type = "windows"
    
    },
    {
      vm_name = "hubcidevorelay001",
      resource_group_name ="hub-ci-devo-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "hubcidevorelay002",
      resource_group_name ="hub-ci-devo-nrg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "hubcidevorelay003",
      resource_group_name ="hub-ci-devo-nrg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBCIFWCLSTR01",
      resource_group_name ="hub-ci-fwgw-rg-002",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBCIFWCLSTR02",
      resource_group_name ="hub-ci-fwgw-rg-002",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBCIFWMGMT004",
      resource_group_name ="hub-ci-fwmgmt-rg-004",
      os_type = "linux"
    
    },
    {
      vm_name = "hubcijenkins02",
      resource_group_name ="hub-ci-jenkins-rg-002",
      os_type = "linux"
    
    },
    {
      vm_name = "hubcinagios003",
      resource_group_name ="hub-ci-nagios-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBCIPSMANDCPM1",
      resource_group_name ="hub-ci-psm-pd-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBCIWSUS001",
      resource_group_name ="hub-ci-wsus-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBNEAD001",
      resource_group_name ="hub-ne-ad-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBNEFWCLSTR01",
      resource_group_name ="hub-ne-fwgw-rg-002",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBNEFWCLSTR02",
      resource_group_name ="hub-ne-fwgw-rg-002",
      os_type = "linux"
    
    },
    
    {
      vm_name = "HUBNEFWMG002",
      resource_group_name ="hub-ne-fwmgmt-nrg-001",
      os_type = "windows"
    
    },
    
     {
      vm_name = "HUBNEFWMG003",
      resource_group_name ="hub-ne-fwmgmt-nrg-003",
      os_type = "windows"
    
    },
    
    # {
    #   vm_name = "HUBNEFWMG003-poc",
    #   resource_group_name ="hub-ne-fwmgmt-nrg-003",
    #   os_type = "windows"
    
    # },
    {
      vm_name = "HUBNEFWMGMT003",
      resource_group_name ="hub-ne-fwmgmt-rg-003",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBNEFWMGMT004",
      resource_group_name ="hub-ne-fwmgmt-rg-004",
      os_type = "linux"
    
    },
    
    {
      vm_name = "HUBNEPSMANDCPM1",
      resource_group_name ="hub-ne-psm-pd-nrg-002",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBSIAD001",
      resource_group_name ="hub-si-ad-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBSIFWCLSTR01",
      resource_group_name ="hub-si-fwgw-rg-002",
      os_type = "linux"
    
    },
     {
      vm_name = "HUBSIFWCLSTR02",
      resource_group_name ="hub-si-fwgw-rg-002",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBWEAD001",
      resource_group_name ="hub-we-ad-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "HUBWEFWCLSTR01",
      resource_group_name ="hub-we-fwgw-rg-002",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBWEFWCLSTR02",
      resource_group_name ="hub-we-fwgw-rg-002",
      os_type = "linux"
    
    },
    {
      vm_name = "HUBWEFWMGMT003",
      resource_group_name ="hub-we-fwmgmt-rg-003",
      os_type = "linux"
    
    },
    {
      vm_name = "hubwelogr001",
      resource_group_name ="hub-we-logr-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdciapphwa001",
      resource_group_name ="prd-ci-hwa-rg-001",
      os_type = "linux"
    
    },
    
    {
      vm_name = "PDCIAVD-0",
      resource_group_name ="pd-ci-avd-rg-001",
      os_type = "windows"
    
    },
    
     {
      vm_name = "pdcidbhwa001",
      resource_group_name ="prd-ci-hwa-rg-001",
      os_type = "linux"
    
    },
    
    {
      vm_name = "pdcidbhwa002",
      resource_group_name ="prd-ci-hwa-rg-001",
      os_type = "linux"
    
    },
    # {
    #   vm_name = "pdciicollectwin01",
    #   resource_group_name ="hub-ci-mitigation-rg-001",
    #   os_type = "windows"
    
    # },
    {
      vm_name = "PDCIINFAVD-1",
      resource_group_name ="pd-ci-avd-rg-003",
      os_type = "windows"
    
    },
    
    {
      vm_name = "PDCIL2AVD-1",
      resource_group_name ="pd-ci-avd-rg-002",
      os_type = "windows"
    
    },
    {
      vm_name = "PDCILAM001",
      resource_group_name ="pd-ci-lam-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "PDCILAM002",
      resource_group_name ="pd-ci-lam-rg-001",
      os_type = "linux"
    
    },
    
     {
      vm_name = "pdsiaksjump001",
      resource_group_name ="pd-si-aks-rg-001",
      os_type = "linux"
    
    },
    
    {
      vm_name = "pdsielk001",
      resource_group_name ="pd-si-elk-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdsiicollect01",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    
    },
    {
      vm_name = "pdsiicollect02",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    
    },
    
    {
      vm_name = "PDSIICOLLECTWIN01",
      resource_group_name ="pd-si-icollect-nrg-01",
      os_type = "windows"
    
    },
    {
      vm_name = "pdsiilmon001",
      resource_group_name ="pd-si-elk-rg-001",
      os_type = "linux"
    
    },
     {
      vm_name = "PDSISFTP001",
      resource_group_name ="pd-si-sftp-nrg-01",
      os_type = "windows"
    
    },
    {
      vm_name = "pdweaksjump001",
      resource_group_name ="pd-we-aks-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "pdweelk001",
      resource_group_name ="pd-we-elk-rg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "PDWEIDM001",
      resource_group_name ="pd-we-sftp-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "PDWESFTP001",
      resource_group_name ="pd-we-sftp-nrg-001",
      os_type = "windows"
    
    },
    {
      vm_name = "RHELVulCheck",
      resource_group_name ="dev-ci-goldenimage-nrg-001",
      os_type = "linux"
    
    },
    {
      vm_name = "sitcidbpg001",
      resource_group_name ="dev-ci-iclear-rg-001",
      os_type = "linux"
    
    },
    
    {
      vm_name = "sitciicollect002",
      resource_group_name ="dev-ci-icollect-rg-001",
      os_type = "linux"
    
    },
    
     {
      vm_name = "TestWin2019v1",
      resource_group_name ="dev-ci-goldenimage-nrg-001",
      os_type = "windows"
    
    },
    
    {
      vm_name = "UbuntuVulCheck",
      resource_group_name ="dev-ci-goldenimage-nrg-001",
      os_type = "linux"
    
    }
    ]
    }
}
