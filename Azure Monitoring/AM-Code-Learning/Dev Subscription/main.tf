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

module "SQL-ManagedInstance-CPUPercent" {
  source = "./Alerts/SQL Managed Instances/Average CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "SQL-ManagedInstance-StorageSpaceUsed" {
  source = "./Alerts/SQL Managed Instances/Storage space used"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-Availability-CI" {
  source = "./Alerts/PostgreSQL-FlexServer-CentralIndia/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-CPUPercent-CI" {
  source = "./Alerts/PostgreSQL-FlexServer-CentralIndia/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-MaximumConnection-CI" {
  source = "./Alerts/PostgreSQL-FlexServer-CentralIndia/Max Connections"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-MemoryPercent-CI" {
  source = "./Alerts/PostgreSQL-FlexServer-CentralIndia/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-OldestTransaction-CI" {
  source = "./Alerts/PostgreSQL-FlexServer-CentralIndia/Oldest Transaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-StoragePercent-CI" {
  source = "./Alerts/PostgreSQL-FlexServer-CentralIndia/Storage Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-Availability-NE" {
  source = "./Alerts/PostgreSQL-Flex Server-North Europe/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-CPUPercent-NE" {
  source = "./Alerts/PostgreSQL-Flex Server-North Europe/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-MaximumConnection-NE" {
  source = "./Alerts/PostgreSQL-Flex Server-North Europe/Max Connections"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-MemoryPercent-NE" {
  source = "./Alerts/PostgreSQL-Flex Server-North Europe/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-OldestTransaction-NE" {
  source = "./Alerts/PostgreSQL-Flex Server-North Europe/Oldest Transaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Flex-StoragePercent-NE" {
  source = "./Alerts/PostgreSQL-Flex Server-North Europe/Storage Percent"
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



module "Cluster-Health" {
  source                = "./Alerts/Azure_Kubernetes_Service/ClusterHealth"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
}

module "Aks-CPU-Percentage" {
  source                = "./Alerts/Azure_Kubernetes_Service/Aks-Cpu-Usage-Percentage"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
}

module "Aks-Disk-Percentage" {
  source                = "./Alerts/Azure_Kubernetes_Service/AKs-Disk-Usage-Percentage"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
}


module "Memory_working_set_Percentage" {
  source                = "./Alerts/Azure_Kubernetes_Service/Memory-WorkingSet_Percentage"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
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
module "application_gateway_resource_health" {
  source  = "./Alerts/ApplicationGateway/Resource Health Alert"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
  
}

module "LogicApps" {
   source = "./Alerts/Logic App/Actions Failed"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "LoadBalancer" {
   source = "./Alerts/Load Balancer"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "Backup-ne" {
  source = "./Alerts/BackupAlert - NE"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "Backup-ci" {
  source = "./Alerts/BackupAlert - CI"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

