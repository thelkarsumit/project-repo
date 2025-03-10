variable "rg_name" {
  default = "RG-AM-Dev-Subscription"
}

variable "virtual-machines" {
  type = map(any)
  default = {
    vms = [{
      vm_name = "devciaksjump002",
      resource_group_name ="DEV-CI-AKS-RG-GB-001",
      os_type = "linux"
    },
    {
      vm_name = "DEVCICTS00001",
      resource_group_name ="dev-ci-cts-rg-001",
      os_type = "windows"
    },

    {
      vm_name = "DEVCICTS02",
      resource_group_name ="dev-ci-cts-rg-001",
      os_type = "windows"
    },
    # {
    #   vm_name = "devcidboracle1",
    #   resource_group_name ="dev-ci-gis-rg-001",
    #   os_type = "linux"
    # },
    {
      vm_name = "devcidboracle2",
      resource_group_name ="dev-ci-gis-rg-002",
      os_type = "linux"
    },
    {
      vm_name = "DEVCIDEVIAC002",
      resource_group_name ="dev-ci-iac-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "devcielk00001",
      resource_group_name ="dev-ci-apacil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "devciexacto0001",
      resource_group_name ="dev-ci-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "devciexacto0002",
      resource_group_name ="dev-ci-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "devcigis00001",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "devcihwa00001",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "linux"
    },

    {
      vm_name = "DEVCIICLCTWIN01",
      resource_group_name ="dev-ci-icollect-rg-01",
      os_type = "windows"
    },
    {
      vm_name = "devcijasper0001",
      resource_group_name ="dev-ci-iclear-rg-001",
      os_type = "linux"
    },
    # {
    #   vm_name = "devcijenkins01",
    #   resource_group_name ="dev-ci-hwa-rg-001",
    #   os_type = "linux"
    # },
    {
      vm_name = "DEVCISFTP00001",
      resource_group_name ="dev-ci-apacil-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "devcisftp11",
      resource_group_name ="dev-ci-apacil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "devneaksjump002",
      resource_group_name ="dev-ne-aks-rg-gb-001",
      os_type = "linux"
    },
    {
      vm_name = "devnechk00001",
      resource_group_name ="dev-ne-chk-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "devneelk00001",
      resource_group_name ="dev-ne-usil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "DEVNEIDM00001",
      resource_group_name ="dev-ne-idmcre-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "DEVNESFTP00001",
      resource_group_name ="dev-ne-apacil-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "devnesftp11",
      resource_group_name ="dev-ne-apacil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "Precigis00001",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "preciiclct001",
      resource_group_name ="dev-ci-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "preciiclct002",
      resource_group_name ="dev-ci-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "PRFTSTCIAPSCN1",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "PRFTSTCIAPSCN2",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "windows"
    },
    # {
    #   vm_name = "rubrikpocaks-vm-0",
    #   resource_group_name ="dev-ci-rubrik-rg-001",
    #   os_type = "linux"
    # },
    {
      vm_name = "SITCIICHQ00001",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "sitciiclct001",
      resource_group_name ="dev-ci-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "sitciiclct002",
      resource_group_name ="dev-ci-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "SITNEICHQ00001",
      resource_group_name ="dev-ne-hwa-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "UATCIGISAUTO004",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "UATCIGISAUTO005",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },

    {
      vm_name = "UATCIGISAUTO006",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "uatciiclct001",
      resource_group_name ="dev-ci-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "UATNEIDM00001",
      resource_group_name ="dev-ne-idmcre-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "UATNEUSDBAUT001",
      resource_group_name ="DEV-NE-ICOLLECT-RG-01",
      os_type = "windows"
    },
    {
      vm_name = "UATCIICOLAUT001",
      resource_group_name ="DEV-CI-ICOLLECT-RG-01",
      os_type = "windows"
    },
    {
      vm_name = "UATCIICLRAUT001",
      resource_group_name ="DEV-CI-ICOLLECT-RG-01",
      os_type = "windows"
    }

    ]
  }
}