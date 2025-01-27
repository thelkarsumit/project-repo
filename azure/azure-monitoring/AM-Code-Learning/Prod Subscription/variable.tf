variable "rg_name" {
  default = "RG-AM-Prod-Subscription"
}

variable "virtual-machines" {
  type = map(any)
  default = {
    vms = [{
      vm_name = "pdciaksjump0001",
      resource_group_name ="prd-ci-aks-rg-gb-001",
      os_type = "linux"
    },
    {
      vm_name = "pdciapphwa00001",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdciapphwa00002",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "PDCICTS00001",
      resource_group_name ="pd-ci-cts-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "PDCICTS02",
      resource_group_name ="pd-ci-cts-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdcidbhwa00001",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdcidbhwa00002",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdcielk00001",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdciexactoapp01",
      resource_group_name ="pd-ci-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdciexactodpt01",
      resource_group_name ="pd-ci-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdciexactohk001",
      resource_group_name ="pd-ci-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "PDCIGISIN00001",
      resource_group_name ="pd-ci-gis-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdciiclct001",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "pdciiclct002",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "PDCIICLCTWIN001",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "windows"
    },
    {
      vm_name = "pdciilmon00001",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdcinagios00002",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "linux"
    },
    # {
    #   vm_name = "pdcinagios00003",
    #   resource_group_name ="pd-ci-apacil-rg-001",
    #   os_type = "linux"
    # },
    # {
    #   vm_name = "pdcinagios00004",
    #   resource_group_name ="pd-ci-apacil-rg-001",
    #   os_type = "linux"
    # },
    {
      vm_name = "PDCISFTP00001",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdneaksjump0001",
      resource_group_name ="prd-ne-aks-rg-gb-001",
      os_type = "linux"
    },
    {
      vm_name = "pdneelk00001",
      resource_group_name ="pd-ne-usil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "PDNEIDM00001",
      resource_group_name ="pd-ne-idmcre-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdnesftp00001",
      resource_group_name ="pd-ne-usil-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdsiaksjump0001",
      resource_group_name ="prd-si-aks-rg-gb-001",
      os_type = "linux"
    },
    {
      vm_name = "pdsiapphwa00001",
      resource_group_name ="pd-si-hwa-rg-001",
      os_type = "linux"
    },
    # {
    #   vm_name = "PDSICTS00001",
    #   resource_group_name ="pd-si-cts-rg-001",
    #   os_type = "windows"
    # },
    {
      vm_name = "PDSICTS02",
      resource_group_name ="pd-si-cts-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdsidbhwa00001",
      resource_group_name ="pd-si-hwa-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdsielk00001",
      resource_group_name ="pd-si-apacil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdsiexactoapp01",
      resource_group_name ="pd-si-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdsiexactodpt01",
      resource_group_name ="pd-si-iclear-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "pdsiexactohk001",
      resource_group_name ="pd-si-iclear-rg-001",
      os_type = "linux"
    },

    {
      vm_name = "PDSIGISIN00001",
      resource_group_name ="pd-si-gis-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdsiiclct001",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "pdsiiclct002",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    },
    {
      vm_name = "PDSIICLCTWIN001",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "windows"
    },
    {
      vm_name = "pdsiilmon00001",
      resource_group_name ="pd-si-apacil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "PDSISFTP00001",
      resource_group_name ="pd-si-apacil-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdweaksjump0001",
      resource_group_name ="prd-we-aks-rg-gb-001",
      os_type = "linux"
    },
    {
      vm_name = "pdweelk00001",
      resource_group_name ="pd-we-usil-rg-001",
      os_type = "linux"
    },
    {
      vm_name = "PDWEIDM00001",
      resource_group_name ="pd-we-idmcre-rg-001",
      os_type = "windows"
    },
    {
      vm_name = "pdwesftp00001",
      resource_group_name ="pd-we-usil-rg-001",
      os_type = "windows"
    },
    #  {
    #   vm_name = "pdcinagios0001",
    #   resource_group_name ="PD-CI-APACIL-RG-001",
    #   os_type = "linux"
    # }
    ]
  }
}