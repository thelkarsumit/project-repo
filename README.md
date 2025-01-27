# Project Folder Structure
'''
├── .git/
│   ├── branches/
│   ├── hooks/
│   ├── info/
│   ├── logs/
│   │   ├── refs/
│   │   │   ├── heads/
│   │   │   ├── remotes/
│   │   │   │   ├── origin/
│   ├── objects/
│   │   ├── 00/
│   │   ├── 01/
│   │   ├── 02/
│   │   ├── 03/
│   │   ├── 04/
│   │   ├── 05/
│   │   ├── 06/
│   │   ├── 07/
│   │   ├── 08/
│   │   ├── 09/
│   │   ├── 0a/
│   │   ├── 0b/
│   │   ├── 0c/
│   │   ├── 0d/
│   │   ├── 0e/
│   │   ├── 0f/
│   │   ├── 10/
│   │   ├── 11/
│   │   ├── 12/
│   │   ├── 13/
│   │   ├── 14/
│   │   ├── 15/
│   │   ├── 16/
│   │   ├── 17/
│   │   ├── 18/
│   │   ├── 19/
│   │   ├── 1a/
│   │   ├── 1b/
│   │   ├── 1c/
│   │   ├── 1d/
│   │   ├── 1e/
│   │   ├── 1f/
│   │   ├── 20/
│   │   ├── 21/
│   │   ├── 22/
│   │   ├── 23/
│   │   ├── 24/
│   │   ├── 25/
│   │   ├── 26/
│   │   ├── 27/
│   │   ├── 28/
│   │   ├── 29/
│   │   ├── 2a/
│   │   ├── 2b/
│   │   ├── 2c/
│   │   ├── 2d/
│   │   ├── 2e/
│   │   ├── 2f/
│   │   ├── 30/
│   │   ├── 31/
│   │   ├── 32/
│   │   ├── 33/
│   │   ├── 34/
│   │   ├── 35/
│   │   ├── 36/
│   │   ├── 37/
│   │   ├── 38/
│   │   ├── 39/
│   │   ├── 3a/
│   │   ├── 3b/
│   │   ├── 3c/
│   │   ├── 3d/
│   │   ├── 3e/
│   │   ├── 3f/
│   │   ├── 40/
│   │   ├── 41/
│   │   ├── 42/
│   │   ├── 43/
│   │   ├── 44/
│   │   ├── 45/
│   │   ├── 46/
│   │   ├── 47/
│   │   ├── 48/
│   │   ├── 49/
│   │   ├── 4a/
│   │   ├── 4b/
│   │   ├── 4c/
│   │   ├── 4d/
│   │   ├── 4e/
│   │   ├── 4f/
│   │   ├── 50/
│   │   ├── 51/
│   │   ├── 52/
│   │   ├── 53/
│   │   ├── 54/
│   │   ├── 55/
│   │   ├── 56/
│   │   ├── 57/
│   │   ├── 58/
│   │   ├── 59/
│   │   ├── 5a/
│   │   ├── 5b/
│   │   ├── 5c/
│   │   ├── 5d/
│   │   ├── 5e/
│   │   ├── 5f/
│   │   ├── 60/
│   │   ├── 61/
│   │   ├── 62/
│   │   ├── 63/
│   │   ├── 64/
│   │   ├── 65/
│   │   ├── 66/
│   │   ├── 67/
│   │   ├── 68/
│   │   ├── 69/
│   │   ├── 6a/
│   │   ├── 6b/
│   │   ├── 6c/
│   │   ├── 6d/
│   │   ├── 6e/
│   │   ├── 6f/
│   │   ├── 70/
│   │   ├── 71/
│   │   ├── 72/
│   │   ├── 73/
│   │   ├── 74/
│   │   ├── 75/
│   │   ├── 76/
│   │   ├── 77/
│   │   ├── 78/
│   │   ├── 79/
│   │   ├── 7a/
│   │   ├── 7b/
│   │   ├── 7c/
│   │   ├── 7d/
│   │   ├── 7e/
│   │   ├── 7f/
│   │   ├── 80/
│   │   ├── 81/
│   │   ├── 82/
│   │   ├── 83/
│   │   ├── 84/
│   │   ├── 85/
│   │   ├── 86/
│   │   ├── 87/
│   │   ├── 88/
│   │   ├── 89/
│   │   ├── 8a/
│   │   ├── 8b/
│   │   ├── 8c/
│   │   ├── 8d/
│   │   ├── 8e/
│   │   ├── 8f/
│   │   ├── 90/
│   │   ├── 91/
│   │   ├── 92/
│   │   ├── 93/
│   │   ├── 94/
│   │   ├── 95/
│   │   ├── 96/
│   │   ├── 97/
│   │   ├── 98/
│   │   ├── 99/
│   │   ├── 9a/
│   │   ├── 9b/
│   │   ├── 9c/
│   │   ├── 9d/
│   │   ├── 9e/
│   │   ├── 9f/
│   │   ├── a0/
│   │   ├── a1/
│   │   ├── a2/
│   │   ├── a3/
│   │   ├── a4/
│   │   ├── a5/
│   │   ├── a6/
│   │   ├── a7/
│   │   ├── a8/
│   │   ├── a9/
│   │   ├── aa/
│   │   ├── ab/
│   │   ├── ac/
│   │   ├── ad/
│   │   ├── ae/
│   │   ├── af/
│   │   ├── b0/
│   │   ├── b1/
│   │   ├── b2/
│   │   ├── b3/
│   │   ├── b4/
│   │   ├── b5/
│   │   ├── b6/
│   │   ├── b7/
│   │   ├── b8/
│   │   ├── b9/
│   │   ├── ba/
│   │   ├── bc/
│   │   ├── bd/
│   │   ├── be/
│   │   ├── bf/
│   │   ├── c0/
│   │   ├── c1/
│   │   ├── c2/
│   │   ├── c3/
│   │   ├── c4/
│   │   ├── c5/
│   │   ├── c6/
│   │   ├── c7/
│   │   ├── c8/
│   │   ├── c9/
│   │   ├── ca/
│   │   ├── cb/
│   │   ├── cc/
│   │   ├── cd/
│   │   ├── ce/
│   │   ├── cf/
│   │   ├── d0/
│   │   ├── d1/
│   │   ├── d2/
│   │   ├── d3/
│   │   ├── d4/
│   │   ├── d5/
│   │   ├── d6/
│   │   ├── d7/
│   │   ├── d8/
│   │   ├── d9/
│   │   ├── da/
│   │   ├── db/
│   │   ├── dc/
│   │   ├── dd/
│   │   ├── de/
│   │   ├── df/
│   │   ├── e0/
│   │   ├── e1/
│   │   ├── e2/
│   │   ├── e3/
│   │   ├── e4/
│   │   ├── e5/
│   │   ├── e6/
│   │   ├── e7/
│   │   ├── e8/
│   │   ├── e9/
│   │   ├── ea/
│   │   ├── eb/
│   │   ├── ec/
│   │   ├── ed/
│   │   ├── ee/
│   │   ├── ef/
│   │   ├── f0/
│   │   ├── f1/
│   │   ├── f2/
│   │   ├── f3/
│   │   ├── f4/
│   │   ├── f5/
│   │   ├── f6/
│   │   ├── f7/
│   │   ├── f8/
│   │   ├── f9/
│   │   ├── fa/
│   │   ├── fb/
│   │   ├── fc/
│   │   ├── fd/
│   │   ├── fe/
│   │   ├── ff/
│   │   ├── info/
│   │   ├── pack/
│   ├── refs/
│   │   ├── heads/
│   │   ├── remotes/
│   │   │   ├── origin/
│   │   ├── tags/
├── ansible/
│   ├── documentation/
│   ├── group_vars/
│   ├── host_vars/
│   ├── inventory/
│   ├── playbooks/
│   ├── roles/
│   │   ├── 01_install_apache/
│   │   │   ├── defaults/
│   │   │   ├── handlers/
│   │   │   ├── tasks/
│   │   │   ├── templates/
│   │   ├── 02_create_user/
│   │   │   ├── defaults/
│   │   │   ├── meta/
│   │   │   ├── tasks/
│   │   │   ├── vars/
│   │   ├── 03_install_powershell/
│   │   │   ├── defaults/
│   │   │   ├── meta/
│   │   │   ├── tasks/
│   ├── vaults/
├── argo-cd/
│   ├── documentation/
├── azure/
│   ├── Active_Directory_Docs/
├── azure-monitoring/
│   ├── AM-Code-Learning/
│   │   ├── Dev Subscription/
│   │   │   ├── ActionGroup/
│   │   │   │   ├── Action Group/
│   │   │   │   ├── ActionGroup-DB/
│   │   │   ├── Alerts/
│   │   │   │   ├── ApplicationGateway/
│   │   │   │   │   ├── Resource Health Alert/
│   │   │   │   ├── Azure_Kubernetes_Service/
│   │   │   │   │   ├── AKs-Disk-Usage-Percentage/
│   │   │   │   │   ├── Aks-Cpu-Usage-Percentage/
│   │   │   │   │   ├── Average-Node-Cpu-Percentage/
│   │   │   │   │   ├── ClusterHealth/
│   │   │   │   │   ├── Container-CPU-Percentage/
│   │   │   │   │   ├── Container-Memory-Percentage/
│   │   │   │   │   ├── Memory-WorkingSet_Percentage/
│   │   │   │   │   ├── Readiness status per node/
│   │   │   │   ├── BackupAlert - CI/
│   │   │   │   ├── BackupAlert - NE/
│   │   │   │   ├── LinuxAlerts/
│   │   │   │   │   ├── CPUUtilization/
│   │   │   │   │   ├── LogicalDiskUsedSpace/
│   │   │   │   │   ├── Memory Used Percentage/
│   │   │   │   │   ├── Memory Used Swap Space/
│   │   │   │   ├── Load Balancer/
│   │   │   │   ├── Logic App/
│   │   │   │   │   ├── Actions Failed/
│   │   │   │   ├── PostgreSQL-Flex Server-North Europe/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── PostgreSQL-FlexServer-CentralIndia/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── SQL Managed Instances/
│   │   │   │   │   ├── Average CPU Percent/
│   │   │   │   │   ├── Storage space used/
│   │   │   │   ├── VMAvailabilityAlert - CI/
│   │   │   │   ├── VMAvailabilityAlert - NE/
│   │   │   │   ├── WindowsAlerts/
│   │   │   │   │   ├── CPUUtilizationAlert/
│   │   │   │   │   ├── DataDiskIOPS - Central India/
│   │   │   │   │   ├── DataDiskIOPS - North Europe/
│   │   │   │   │   ├── LogicalDiskFreeSpace/
│   │   │   │   │   ├── MemoryAvailableBytes/
│   │   │   │   │   ├── System Event Log ShutdownStart/
│   │   │   ├── DCR/
│   │   │   ├── LAW/
│   │   ├── Microsoft Azure/
│   │   │   ├── ActionGroup/
│   │   │   │   ├── Action Group/
│   │   │   │   ├── ActionGroup-DB/
│   │   │   │   ├── ActionGroup-Windows Services/
│   │   │   ├── Alerts/
│   │   │   │   ├── App Insight/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── Browser Exceptions/
│   │   │   │   │   ├── Browser Page Load Time/
│   │   │   │   │   ├── Dependency Duration/
│   │   │   │   │   ├── Failed requests/
│   │   │   │   │   ├── Process CPU/
│   │   │   │   │   ├── Server exceptions/
│   │   │   │   │   ├── Server response time/
│   │   │   │   ├── Application Gateway/
│   │   │   │   │   ├── Resource Health Alert/
│   │   │   │   ├── Azure_Kubernetes_Service/
│   │   │   │   │   ├── AKs-Disk-Usage-Percentage/
│   │   │   │   │   ├── Aks-Cpu-Usage-Percentage/
│   │   │   │   │   ├── Average-Node-Cpu-Percentage/
│   │   │   │   │   ├── ClusterHealth/
│   │   │   │   │   ├── Container-CPU-Percentage/
│   │   │   │   │   ├── Container-Memory-Percentage/
│   │   │   │   │   ├── Memory-WorkingSet_Percentage/
│   │   │   │   │   ├── Readiness status per node/
│   │   │   │   ├── Backup Alert - CI/
│   │   │   │   ├── Backup Alert - NE/
│   │   │   │   ├── Backup Alert - SI/
│   │   │   │   ├── Backup Alert - WE/
│   │   │   │   ├── Data Factory/
│   │   │   │   │   ├── PipelineFailedRuns/
│   │   │   │   ├── Function App/
│   │   │   │   │   ├── Http 5xx/
│   │   │   │   │   ├── Http Response Time/
│   │   │   │   ├── LinuxAlerts/
│   │   │   │   │   ├── CPUUtilization/
│   │   │   │   │   ├── LogicalDiskUsedSpace/
│   │   │   │   │   ├── Memory Used Percentage/
│   │   │   │   │   ├── Memory Used Swap Space/
│   │   │   │   ├── Load Balancer/
│   │   │   │   ├── Logic App/
│   │   │   │   │   ├── Action Failed/
│   │   │   │   ├── PostGreSql-Flexible-Servers-Central-India/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── PostGreSql-FlexibleServer-NE/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU-Percent/
│   │   │   │   │   ├── Maximum-Connection/
│   │   │   │   │   ├── MemoryPercent/
│   │   │   │   │   ├── OldestTransaction/
│   │   │   │   │   ├── StoragePercent/
│   │   │   │   ├── PostGreSql-FlexibleServer-SouthIndia/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CpuPercent/
│   │   │   │   │   ├── MaximumConnection/
│   │   │   │   │   ├── MemoryPercent/
│   │   │   │   │   ├── OldestTransaction/
│   │   │   │   │   ├── StoragePercent/
│   │   │   │   ├── PostgreSQL Flexible Server/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Deadlocks/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── PostgreSQL-SingleServer/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── SQL Managed Instance/
│   │   │   │   │   ├── Average CPU Percent/
│   │   │   │   │   ├── Storage space used/
│   │   │   │   ├── Traffic Manager Profile/
│   │   │   │   │   ├── Resource-Health/
│   │   │   │   ├── VMAvailabilityAlert - Central India/
│   │   │   │   ├── VMAvailabilityAlert - NorthEurope/
│   │   │   │   ├── VMAvailabilityAlert - South India/
│   │   │   │   ├── VMAvailabilityAlert - West Europe/
│   │   │   │   ├── Windows Services/
│   │   │   │   ├── WindowsAlerts/
│   │   │   │   │   ├── CPUUtilizationAlert/
│   │   │   │   │   ├── DataDiskIOPS - Central India/
│   │   │   │   │   ├── DataDiskIOPS - North Europe/
│   │   │   │   │   ├── DataDiskIOPS - South India/
│   │   │   │   │   ├── DataDiskIOPS - West Europe/
│   │   │   │   │   ├── LogicalDiskFreeSpace/
│   │   │   │   │   ├── MemoryAvailableBytes/
│   │   │   │   │   ├── System Event Log ShutdownStart/
│   │   │   ├── DCR/
│   │   │   ├── LAW/
│   │   ├── Prod Subscription/
│   │   │   ├── ActionGroup/
│   │   │   │   ├── Action Group/
│   │   │   │   ├── ActionGroup-DB/
│   │   │   │   ├── ActionGroup-WindowsServices/
│   │   │   ├── Alerts/
│   │   │   │   ├── ApplicationGateway/
│   │   │   │   │   ├── Resource Health Alert/
│   │   │   │   ├── Azure_Kubernetes_Service/
│   │   │   │   │   ├── AKs-Disk-Usage-Percentage/
│   │   │   │   │   ├── Aks-Cpu-Usage-Percentage/
│   │   │   │   │   ├── Average-Node-Cpu-Percentage/
│   │   │   │   │   ├── ClusterHealth/
│   │   │   │   │   ├── Container-CPU-Percentage/
│   │   │   │   │   ├── Container-Memory-Percentage/
│   │   │   │   │   ├── Memory-WorkingSet_Percentage/
│   │   │   │   │   ├── Readiness status per node/
│   │   │   │   ├── BackupAlert - CI/
│   │   │   │   ├── BackupAlert - NE/
│   │   │   │   ├── BackupAlert - SI/
│   │   │   │   ├── BackupAlert - WE/
│   │   │   │   ├── ConnectionMonitor Alerts/
│   │   │   │   │   ├── PortMonitor Alerts/
│   │   │   │   │   │   ├── APACIL-DR-PortMonitor/
│   │   │   │   │   │   ├── APACIL-Prod-PortMonitor/
│   │   │   │   │   │   ├── ICollect-Prod-PortMonitor/
│   │   │   │   ├── LinuxAlerts/
│   │   │   │   │   ├── CPUUtilization/
│   │   │   │   │   ├── LogicalDiskUsedSpace/
│   │   │   │   │   ├── Memory Used Percentage/
│   │   │   │   │   ├── Memory Used Swap Space/
│   │   │   │   ├── Load Balancer/
│   │   │   │   ├── PostgreSQL - Flexible Server - North Europe/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── PostgreSQL - Flexible Server - South India/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── PostgreSQL - Flexible Server - West Europe/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── PostgreSQL - FlexibleServer - CentralIndia/
│   │   │   │   │   ├── Availability/
│   │   │   │   │   ├── CPU Percent/
│   │   │   │   │   ├── Max Connections/
│   │   │   │   │   ├── Memory Percent/
│   │   │   │   │   ├── Oldest Transaction/
│   │   │   │   │   ├── Storage Percent/
│   │   │   │   ├── SQL Managed Instance/
│   │   │   │   │   ├── Average CPU Percent/
│   │   │   │   │   ├── Storage space used/
│   │   │   │   ├── VMAvailabilityAlert - CI/
│   │   │   │   ├── VMAvailabilityAlert - NE/
│   │   │   │   ├── VMAvailabilityAlert - SI/
│   │   │   │   ├── VMAvailabilityAlert - WE/
│   │   │   │   ├── Windows Services/
│   │   │   │   ├── WindowsAlerts/
│   │   │   │   │   ├── CPUUtilizationAlert/
│   │   │   │   │   ├── DataDiskIOPS - Central India/
│   │   │   │   │   ├── DataDiskIOPS - North Europe/
│   │   │   │   │   ├── DataDiskIOPS - South India/
│   │   │   │   │   ├── DataDiskIOPS - West Europe/
│   │   │   │   │   ├── LogicalDiskFreeSpace/
│   │   │   │   │   ├── MemoryAvailableBytes/
│   │   │   │   │   ├── System Event Log ShutdownStart/
│   │   │   ├── DCR/
│   │   │   ├── LAW/
│   ├── AM-DOC/
├── docker/
│   ├── dockerfile/
│   ├── documentation/
├── google-kubernetes-engine/
│   ├── documentation/
│   ├── manifest_files/
├── jenkins/
│   ├── docker-images-cicd-pipeline/
│   │   ├── Hello_world_docker_image/
│   │   │   ├── src/
│   │   │   │   ├── main/
│   │   │   │   │   ├── java/
│   │   ├── my-website-docker/
│   ├── documentation/
│   ├── terraform-cicd-pipeline/
├── old-work-for-reference/
│   ├── 00-landing_zone_module/
│   │   ├── landing_zone_module/
│   │   │   ├── module/
│   │   │   │   ├── cloud_sql-mssql/
│   │   │   │   ├── firewall_rules/
│   │   │   │   ├── load-balancer/
│   │   │   │   ├── mig/
│   │   │   │   ├── nat/
│   │   │   │   ├── storage/
│   │   │   │   ├── vm/
│   │   │   │   ├── vpc/
│   │   │   ├── temp/
│   │   │   │   ├── cloud_sql_temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── firewall_temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── jenkins-private-server-temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.14.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── load-balancer-temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── mig_temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── nat_temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── storage_temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.12.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── two-tier-app/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.14.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── vm_temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.12.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   │   ├── vpc_temp/
│   │   │   │   │   ├── .terraform/
│   │   │   │   │   │   ├── modules/
│   │   │   │   │   │   ├── providers/
│   │   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   │   ├── 6.12.0/
│   │   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   ├── module/
│   │   │   ├── cloud_sql-mssql/
│   │   │   ├── firewall_rules/
│   │   │   ├── load-balancer/
│   │   │   ├── mig/
│   │   │   ├── nat/
│   │   │   ├── storage/
│   │   │   ├── vm/
│   │   │   ├── vpc/
│   │   ├── temp/
│   │   │   ├── cloud_sql_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── firewall_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── jenkins-private-server-temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.14.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── load-balancer-temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── mig_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── nat_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── storage_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.12.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── two-tier-app/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.14.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── vm_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.12.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── vpc_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.12.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   ├── 01-jenkins-learn-appbuild/
│   │   ├── my-app/
│   │   │   ├── src/
│   │   │   │   ├── main/
│   │   │   │   │   ├── java/
│   │   │   │   │   │   ├── com/
│   │   │   │   │   │   │   ├── example/
│   │   │   │   ├── test/
│   │   │   │   │   ├── java/
│   │   │   │   │   │   ├── com/
│   │   │   │   │   │   │   ├── example/
├── powershell/
│   ├── documentation/
│   ├── powershell_scripts_for_GCP_tasks/
├── python_learning/
│   ├── documentation/
│   ├── gcp_python_projects/
│   │   ├── 01_create_gcp_project_with_python/
│   │   │   ├── config/
│   │   │   ├── src/
│   │   ├── 02_manage_gcp_storage_with_python/
│   │   │   ├── config/
│   │   │   ├── src/
│   ├── personal-expense-tracker-project/
│   │   ├── 01-gcp-storage-personal-expense-tracker/
│   │   │   ├── templates/
│   │   ├── 02-gcp-sql-personal-expense-tracker/
│   │   ├── 03-mig-loadbalancer-personal-expense-tracker/
│   ├── python_usecase/
├── revision_plan/
│   ├── documentation/
│   ├── images/
├── terraform_landing_zone/
│   ├── module/
│   │   ├── cloud_sql-mssql/
│   │   ├── firewall_rules/
│   │   ├── gcp-monitoring/
│   │   │   ├── modules/
│   │   │   │   ├── availability_monitoring/
│   │   │   │   ├── cpu_utilization/
│   │   │   │   ├── disk_utilization/
│   │   │   │   ├── port_monitoring/
│   │   │   │   ├── url_monitoring/
│   │   │   ├── temp-project1/
│   │   │   ├── temp-project2/
│   │   ├── load-balancer/
│   │   ├── mig/
│   │   ├── nat/
│   │   ├── storage/
│   │   ├── vm/
│   │   ├── vpc/
│   ├── template/
│   │   ├── mig_temp/
│   │   │   ├── .terraform/
│   │   │   │   ├── modules/
│   │   │   │   ├── providers/
│   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   ├── 6.13.0/
│   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   ├── vm_temp/
│   │   │   ├── ansible_control_node_vm_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.15.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── ansible_managed_nodes_vm_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.15.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   │   ├── jenkins_master_slave_temp/
│   │   │   │   ├── .terraform/
│   │   │   │   │   ├── modules/
│   │   │   │   │   ├── providers/
│   │   │   │   │   │   ├── registry.terraform.io/
│   │   │   │   │   │   │   ├── hashicorp/
│   │   │   │   │   │   │   │   ├── google/
│   │   │   │   │   │   │   │   │   ├── 6.16.0/
│   │   │   │   │   │   │   │   │   │   ├── linux_amd64/
│   │   ├── vpc_temp/
'''