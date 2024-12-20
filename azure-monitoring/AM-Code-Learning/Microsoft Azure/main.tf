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

module "ActionGroup-Services" {
  source = "./ActionGroup/ActionGroup-Windows Services"
  rg_name = var.rg_name
}

module "DCR" {
  source = "./DCR"
  rg_name = var.rg_name
  virtual_machines = var.virtual-machines
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

module "VMAvailability-CentralIndia" {
source="./Alerts/VMAvailabilityAlert - Central India"
rg_name=var.rg_name
action_group_id = module.ActionGroup.action_group_id
}

module "VMAvailability-NorthEurope" {
source="./Alerts/VMAvailabilityAlert - NorthEurope"
rg_name=var.rg_name
action_group_id = module.ActionGroup.action_group_id
}

module "VMAvailability-WestEurope" {
source="./Alerts/VMAvailabilityAlert - West Europe"
rg_name=var.rg_name
action_group_id = module.ActionGroup.action_group_id
}

module "VMAvailability-SouthIndia" {
source="./Alerts/VMAvailabilityAlert - South India"
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

module "LogicApps" {
   source = "./Alerts/Logic App/Action Failed"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
}
 
module "FunctionApps" {
   source = "./Alerts/Function App/Http 5xx"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "Http-Response-Time" {
   source = "./Alerts/Function App/Http Response Time"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "AppInsights-Availability" {
   source = "./Alerts/App Insight/Availability"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
}
 
module "AppInsights-BrowserException" {
   source = "./Alerts/App Insight/Browser Exceptions"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
}
 
module "AppInsights-Browser-Page-Load-Time" {
   source = "./Alerts/App Insight/Browser Page Load Time"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "AppInsights-Dependency-Duration" {
   source = "./Alerts/App Insight/Dependency Duration"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "AppInsights-Failed-Req" {
   source = "./Alerts/App Insight/Failed requests"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "AppInsights-Process-cpu" {
   source = "./Alerts/App Insight/Process CPU"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "AppInsights-Server-Exceptions" {
   source = "./Alerts/App Insight/Server exceptions"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "AppInsights-Server-Response_Time" {
   source = "./Alerts/App Insight/Server response time"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
 }
 
module "DataFactory" {
   source = "./Alerts/Data Factory/PipelineFailedRuns"
   action_group_id = module.ActionGroup.action_group_id
   rg_name = var.rg_name
}
 
module "LoadBalancer" {
  source = "./Alerts/Load Balancer"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}
 
module "Backup-ci" {
  source = "./Alerts/Backup Alert - CI"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "Backup-ne" {
  source = "./Alerts/Backup Alert - NE"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "Backup-si" {
  source = "./Alerts/Backup Alert - SI"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}

module "Backup-we" {
  source = "./Alerts/Backup Alert - WE"
  action_group_id = module.ActionGroup.action_group_id
  rg_name = var.rg_name
}
 
 
 
 

# module "PostgreSQL-CPU-Percent" {
#   source = "./Alerts/PostgreSQL Flexible Server/CPU Percent"
#   action_group_id = module.ActionGroup.action_group_id
#   rg_name = var.rg_name
# }

# module "PostgreSQL-Memory-Percent" {
#   source = "./Alerts/PostgreSQL Flexible Server/Memory Percent"
#   action_group_id = module.ActionGroup.action_group_id
#   rg_name = var.rg_name
# }

# module "PostgreSQL-Storage-Percent" {
#   source = "./Alerts/PostgreSQL Flexible Server/Storage Percent"
#   action_group_id = module.ActionGroup.action_group_id
#   rg_name = var.rg_name
# }

# module "PostgreSQL-Availability" {
#   source = "./Alerts/PostgreSQL Flexible Server/Availability"
#   action_group_id = module.ActionGroup.action_group_id
#   rg_name = var.rg_name
# }

# module "PostgreSQL-Oldest-Transaction" {
#   source = "./Alerts/PostgreSQL Flexible Server/Oldest Transaction"
#   action_group_id = module.ActionGroup.action_group_id
#   rg_name = var.rg_name
# }

# module "PostGreSQL-Deadlock"{
#     source = "./Alerts/PostgreSQL/Deadlocks"
#     rg_name               = var.rg_name
#     action_group_id       = module.ActionGroup.action_group_id
# }

# module "PostGreSQL-Max-Connection"{
#     source = "./Alerts/PostgreSQL Flexible Server/Max Connections"
#     rg_name               = var.rg_name
#     action_group_id       = module.ActionGroup.action_group_id
# }

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

module "PostgreSQL-Single-CPU-Percent" {
  source = "./Alerts/PostgreSQL-SingleServer/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Single-Memory-Percent" {
  source = "./Alerts/PostgreSQL-SingleServer/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-Single-Storage-Percent" {
  source = "./Alerts/PostgreSQL-SingleServer/Storage Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-Availability-CentralIndia" {
  source = "./Alerts/PostGreSql-Flexible-Servers-Central-India/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-cpu_percent-CentralIndia" {
  source = "./Alerts/PostGreSql-Flexible-Servers-Central-India/CPU Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-Maximum-Connection-CentralIndia" {
  source = "./Alerts/PostGreSql-Flexible-Servers-Central-India/Max Connections"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-MemoryPercent-CentralIndia" {
  source = "./Alerts/PostGreSql-Flexible-Servers-Central-India/Memory Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-OldestTransaction-CentralIndia" {
  source = "./Alerts/PostGreSql-Flexible-Servers-Central-India/Oldest Transaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-storage_percent-CentralIndia" {
  source = "./Alerts/PostGreSql-Flexible-Servers-Central-India/Storage Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-Availability-NorthEurope" {
  source = "./Alerts/PostGreSql-FlexibleServer-NE/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-CPUPercent-NorthEurope" {
  source = "./Alerts/PostGreSql-FlexibleServer-NE/CPU-Percent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-MaximumConnections-NorthEurope" {
  source = "./Alerts/PostGreSql-FlexibleServer-NE/Maximum-Connection"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}


module "PostgreSQL-FlexibleServers-memory-percent-NorthEurope" {
  source = "./Alerts/PostGreSql-FlexibleServer-NE/MemoryPercent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-Oldest-Transaction-NorthEurope" {
  source = "./Alerts/PostGreSql-FlexibleServer-NE/OldestTransaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-Storage-Percent-NorthEurope" {
  source = "./Alerts/PostGreSql-FlexibleServer-NE/StoragePercent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-availability-SI" {
  source = "./Alerts/PostGreSql-FlexibleServer-SouthIndia/Availability"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-CpuPercent-SI" {
  source = "./Alerts/PostGreSql-FlexibleServer-SouthIndia/CpuPercent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-MaximumConnection-SI" {
  source = "./Alerts/PostGreSql-FlexibleServer-SouthIndia/MaximumConnection"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-MemoryPercent-SI" {
  source = "./Alerts/PostGreSql-FlexibleServer-SouthIndia/MemoryPercent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-OldestTransaction-SI" {
  source = "./Alerts/PostGreSql-FlexibleServer-SouthIndia/OldestTransaction"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
}

module "PostgreSQL-FlexibleServers-StoragePercent-SI" {
  source = "./Alerts/PostGreSql-FlexibleServer-SouthIndia/StoragePercent"
  action_group_db_id = module.ActionGroup-DB.action_group_db_id
  rg_name = var.rg_name
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
module "application_gateway_resource_health_alert" {
  source  = "./Alerts/Application Gateway/Resource Health Alert"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
  
}

module "hub_traffic_manager_profile" {
  source  = "./Alerts/Traffic Manager Profile/Resource-Health"
  rg_name               = var.rg_name
  action_group_id       = module.ActionGroup.action_group_id
  
}

module "WindowsServices" {
  source = "./Alerts/Windows Services"
  rg_name = var.rg_name
  action_group_id = module.ActionGroup-Services.action_group_id
  workspace_resource_id = module.law.log_id
}