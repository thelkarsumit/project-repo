module "law" {
  source  = "./LAW"
  rg_name = var.rg_name
}

module "ActionGroup" {
  source = "./ActionGroup/Action Group"
  rg_name = var.rg_name
}

module "ActionGroup-DB" {
  source = "./ActionGroup/ActionGroup-DB"
  rg_name = var.rg_name
}

module "ActionGroup-WindowsServices" {
  source = "./ActionGroup/ActionGroup-WindowsServices"
}

module "SQL-ManagedInstance-CPUPercent" {
  source = "./Alerts/SQL Managed Instance/Average CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "SQL-ManagedInstance-StorageSpaceUsed" {
  source = "./Alerts/SQL Managed Instance/Storage space used"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-Availability-CI" {
  source = "./Alerts/PostgreSQL - FlexibleServer - CentralIndia/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-CPUPercent-CI" {
  source = "./Alerts/PostgreSQL - FlexibleServer - CentralIndia/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MaximumConnection-CI" {
  source = "./Alerts/PostgreSQL - FlexibleServer - CentralIndia/Max Connections"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MemoryPercent-CI" {
  source = "./Alerts/PostgreSQL - FlexibleServer - CentralIndia/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-OldestTransaction-CI" {
  source = "./Alerts/PostgreSQL - FlexibleServer - CentralIndia/Oldest Transaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-StoragePercent-CI" {
  source = "./Alerts/PostgreSQL - FlexibleServer - CentralIndia/Storage Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-Availability-NE" {
  source = "./Alerts/PostgreSQL - Flexible Server - North Europe/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-CPUPercent-NE" {
  source = "./Alerts/PostgreSQL - Flexible Server - North Europe/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MaximumConnection-NE" {
  source = "./Alerts/PostgreSQL - Flexible Server - North Europe/Max Connections"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MemoryPercent-NE" {
  source = "./Alerts/PostgreSQL - Flexible Server - North Europe/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-OldestTransaction-NE" {
  source = "./Alerts/PostgreSQL - Flexible Server - North Europe/Oldest Transaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-StoragePercent-NE" {
  source = "./Alerts/PostgreSQL - Flexible Server - North Europe/Storage Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-Availability-SI" {
  source = "./Alerts/PostgreSQL - Flexible Server - South India/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-CPUPercent-SI" {
  source = "./Alerts/PostgreSQL - Flexible Server - South India/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MaximumConnection-SI" {
  source = "./Alerts/PostgreSQL - Flexible Server - South India/Max Connections"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MemoryPercent-SI" {
  source = "./Alerts/PostgreSQL - Flexible Server - South India/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-OldestTransaction-SI" {
  source = "./Alerts/PostgreSQL - Flexible Server - South India/Oldest Transaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-StoragePercent-SI" {
  source = "./Alerts/PostgreSQL - Flexible Server - South India/Storage Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-Availability-WE" {
  source = "./Alerts/PostgreSQL - Flexible Server - West Europe/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-CPUPercent-WE" {
  source = "./Alerts/PostgreSQL - Flexible Server - West Europe/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MaximumConnection-WE" {
  source = "./Alerts/PostgreSQL - Flexible Server - West Europe/Max Connections"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-MemoryPercent-WE" {
  source = "./Alerts/PostgreSQL - Flexible Server - West Europe/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-OldestTransaction-WE" {
  source = "./Alerts/PostgreSQL - Flexible Server - West Europe/Oldest Transaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServer-StoragePercent-WE" {
  source = "./Alerts/PostgreSQL - Flexible Server - West Europe/Storage Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "DCR" {
  source                = "./DCR"
  rg_name               = var.rg_name
  virtual_machines      = var.virtual-machines
  workspace_resource_id = module.law.log_id
}

module "Windows-CPUUtil" {
  source                = "./Alerts/WindowsAlerts/CPUUtilizationAlert"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id
}

module "Windows-DataDiskIOPS-Central" {
  source                = "./Alerts/WindowsAlerts/DataDiskIOPS - Central India"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
}

module "Windows-DataDiskIOPS-North" {
  source                = "./Alerts/WindowsAlerts/DataDiskIOPS - North Europe"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
}

module "Windows-DataDiskIOPS-South" {
  source                = "./Alerts/WindowsAlerts/DataDiskIOPS - South India"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
}

module "Windows-DataDiskIOPS-West" {
  source                = "./Alerts/WindowsAlerts/DataDiskIOPS - West Europe"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
}

module "Windows-LogicalDiskFreeSpace" {
  source                = "./Alerts/WindowsAlerts/LogicalDiskFreeSpace"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id
}

module "Windows-MemoryAvailableBytes" {
  source                = "./Alerts/WindowsAlerts/MemoryAvailableBytes"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id
}

module "Windows-SystemEventLog" {
  source                = "./Alerts/WindowsAlerts/System Event Log ShutdownStart"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id
}


module "Linux-CPUUtilization" {
  source                = "./Alerts/LinuxAlerts/CPUUtilization"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id  
}

module "Linux-LogicalDiskUsedSpace" {
  source                = "./Alerts/LinuxAlerts/LogicalDiskUsedSpace"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id  
}

module "Linux-MemoryUsedPercentage" {
  source                = "./Alerts/LinuxAlerts/Memory Used Percentage"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       =module.ActionGroup.action_group_id  
}

module "Linux-MemoryUsedSwapSpace" {
  source                = "./Alerts/LinuxAlerts/Memory Used Swap Space"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id  
}

module "VMAvailability-CentralIndia" {
source="./Alerts/VMAvailabilityAlert - CI"
rg_name=var.rg_name
action_group_id = module.ActionGroup.action_group_id
}

module "VMAvailability-NorthEurope" {
source="./Alerts/VMAvailabilityAlert - NE"
rg_name=var.rg_name
action_group_id = module.ActionGroup.action_group_id
}

module "VMAvailability-SouthIndia" {
source="./Alerts/VMAvailabilityAlert - SI"
rg_name=var.rg_name
action_group_id = module.ActionGroup.action_group_id
}

module "VMAvailability-WestEurope" {
source="./Alerts/VMAvailabilityAlert - WE"
rg_name=var.rg_name
action_group_id = module.ActionGroup.action_group_id
}

module "LoadBalancer" {
  source = "./Alerts/Load Balancer"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
 }

module "Backup-ci" {
  source = "./Alerts/BackupAlert - CI"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "Backup-ne" {
  source = "./Alerts/BackupAlert - NE"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "Backup-si" {
  source = "./Alerts/BackupAlert - SI"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "Backup-we" {
  source = "./Alerts/BackupAlert - WE"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "app_gateway_resource_health" {
  source  = "./Alerts/ApplicationGateway/Resource Health Alert"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
  
}


module "Aks-ClusterHealth" {
   source = "./Alerts/Azure_Kubernetes_Service/ClusterHealth"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }

module "Aks-Cpu-Usage-Percent" {
   source = "./Alerts/Azure_Kubernetes_Service/Aks-Cpu-Usage-Percentage"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "Aks-Disk-Usage-Percent" {
   source = "./Alerts/Azure_Kubernetes_Service/AKs-Disk-Usage-Percentage"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }

module "Aks-Memory-Percent" {
   source = "./Alerts/Azure_Kubernetes_Service/Memory-WorkingSet_Percentage"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }

 module "ContainerCPU-Percentage" {
  source                = "./Alerts/Azure_Kubernetes_Service/Container-CPU-Percentage"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
  workspace_resource_id = module.law.log_id
}

module "Container_Memory_Percentage" {
  source                = "./Alerts/Azure_Kubernetes_Service/Container-Memory-Percentage"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
  workspace_resource_id = module.law.log_id
}

# module "Average_Node_CPU" {
#   source                = "./Alerts/Azure_Kubernetes_Service/Average-Node-Cpu-Percentage"
#   rg_name               = var.rg_name
#   action_group_id       = module.ActionGroup.action_group_id
#   workspace_resource_id = module.law.log_id
  
# }

# module "Readiness_Status" {
#   source                = "./Alerts/Azure_Kubernetes_Service/Readiness status per node"
#   rg_name               = var.rg_name
#   action_group_id       = module.ActionGroup.action_group_id
#   workspace_resource_id = module.law.log_id
  
# }

module "WindowsServices" {
  source = "./Alerts/Windows Services"
  rg_name = var.rg_name
  action_group_id = module.ActionGroup-WindowsServices.action_group_windowsservices_id
  workspace_resource_id = module.law.log_id
}

module "Linux-ServicesMonitoring" {
  source                = "./Alerts/ConnectionMonitor Alerts/PortMonitor Alerts/APACIL-Prod-PortMonitor"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id  
}

module "Linux-ServicesMonitoring-DR" {
  source                = "./Alerts/ConnectionMonitor Alerts/PortMonitor Alerts/APACIL-DR-PortMonitor"
  rg_name               = var.rg_name
  workspace_resource_id = module.law.log_id
  action_group_id       = module.ActionGroup.action_group_id  
}

# module "Linux-ServicesMonitoring-ICollect-Prod" {
#   source                = "./Alerts/ConnectionMonitor Alerts/PortMonitor Alerts/ICollect-Prod-PortMonitor"
#   rg_name               = var.rg_name
#   workspace_resource_id = module.law.log_id
#   action_group_id       = module.ActionGroup.action_group_id  
# }
