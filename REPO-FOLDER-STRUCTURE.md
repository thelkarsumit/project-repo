# Project Folder Structure

```text
├── .github/
│   ├── config/
│   ├── docs/
│   ├── scripts/
│   ├── workflows/
├── README.md
├── REPO-FOLDER-STRUCTURE.md
├── ansible/
│   ├── README.md
│   ├── ansible.cfg
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
│   ├── active_directory_docs/
│   ├── azure-monitoring/
│   │   ├── AM-Code-Learning/
│   │   │   ├── Dev Subscription/
│   │   │   │   ├── ActionGroup/
│   │   │   │   │   ├── Action Group/
│   │   │   │   │   ├── ActionGroup-DB/
│   │   │   │   ├── Alerts/
│   │   │   │   │   ├── ApplicationGateway/
│   │   │   │   │   ├── Azure_Kubernetes_Service/
│   │   │   │   │   ├── BackupAlert - CI/
│   │   │   │   │   ├── BackupAlert - NE/
│   │   │   │   │   ├── LinuxAlerts/
│   │   │   │   │   ├── Load Balancer/
│   │   │   │   │   ├── Logic App/
│   │   │   │   │   ├── PostgreSQL-Flex Server-North Europe/
│   │   │   │   │   ├── PostgreSQL-FlexServer-CentralIndia/
│   │   │   │   │   ├── SQL Managed Instances/
│   │   │   │   │   ├── VMAvailabilityAlert - CI/
│   │   │   │   │   ├── VMAvailabilityAlert - NE/
│   │   │   │   │   ├── WindowsAlerts/
│   │   │   │   ├── DCR/
│   │   │   │   ├── LAW/
│   │   │   ├── Microsoft Azure/
│   │   │   │   ├── ActionGroup/
│   │   │   │   │   ├── Action Group/
│   │   │   │   │   ├── ActionGroup-DB/
│   │   │   │   │   ├── ActionGroup-Windows Services/
│   │   │   │   ├── Alerts/
│   │   │   │   │   ├── App Insight/
│   │   │   │   │   ├── Application Gateway/
│   │   │   │   │   ├── Azure_Kubernetes_Service/
│   │   │   │   │   ├── Backup Alert - CI/
│   │   │   │   │   ├── Backup Alert - NE/
│   │   │   │   │   ├── Backup Alert - SI/
│   │   │   │   │   ├── Backup Alert - WE/
│   │   │   │   │   ├── Data Factory/
│   │   │   │   │   ├── Function App/
│   │   │   │   │   ├── LinuxAlerts/
│   │   │   │   │   ├── Load Balancer/
│   │   │   │   │   ├── Logic App/
│   │   │   │   │   ├── PostGreSql-Flexible-Servers-Central-India/
│   │   │   │   │   ├── PostGreSql-FlexibleServer-NE/
│   │   │   │   │   ├── PostGreSql-FlexibleServer-SouthIndia/
│   │   │   │   │   ├── PostgreSQL Flexible Server/
│   │   │   │   │   ├── PostgreSQL-SingleServer/
│   │   │   │   │   ├── SQL Managed Instance/
│   │   │   │   │   ├── Traffic Manager Profile/
│   │   │   │   │   ├── VMAvailabilityAlert - Central India/
│   │   │   │   │   ├── VMAvailabilityAlert - NorthEurope/
│   │   │   │   │   ├── VMAvailabilityAlert - South India/
│   │   │   │   │   ├── VMAvailabilityAlert - West Europe/
│   │   │   │   │   ├── Windows Services/
│   │   │   │   │   ├── WindowsAlerts/
│   │   │   │   ├── DCR/
│   │   │   │   ├── LAW/
│   │   │   ├── Prod Subscription/
│   │   │   │   ├── ActionGroup/
│   │   │   │   │   ├── Action Group/
│   │   │   │   │   ├── ActionGroup-DB/
│   │   │   │   │   ├── ActionGroup-WindowsServices/
│   │   │   │   ├── Alerts/
│   │   │   │   │   ├── ApplicationGateway/
│   │   │   │   │   ├── Azure_Kubernetes_Service/
│   │   │   │   │   ├── BackupAlert - CI/
│   │   │   │   │   ├── BackupAlert - NE/
│   │   │   │   │   ├── BackupAlert - SI/
│   │   │   │   │   ├── BackupAlert - WE/
│   │   │   │   │   ├── ConnectionMonitor Alerts/
│   │   │   │   │   ├── LinuxAlerts/
│   │   │   │   │   ├── Load Balancer/
│   │   │   │   │   ├── PostgreSQL - Flexible Server - North Europe/
│   │   │   │   │   ├── PostgreSQL - Flexible Server - South India/
│   │   │   │   │   ├── PostgreSQL - Flexible Server - West Europe/
│   │   │   │   │   ├── PostgreSQL - FlexibleServer - CentralIndia/
│   │   │   │   │   ├── SQL Managed Instance/
│   │   │   │   │   ├── VMAvailabilityAlert - CI/
│   │   │   │   │   ├── VMAvailabilityAlert - NE/
│   │   │   │   │   ├── VMAvailabilityAlert - SI/
│   │   │   │   │   ├── VMAvailabilityAlert - WE/
│   │   │   │   │   ├── Windows Services/
│   │   │   │   │   ├── WindowsAlerts/
│   │   │   │   ├── DCR/
│   │   │   │   ├── LAW/
│   │   ├── AM-DOC/
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
│   │   │   │   ├── firewall_temp/
│   │   │   │   ├── jenkins-private-server-temp/
│   │   │   │   ├── load-balancer-temp/
│   │   │   │   ├── mig_temp/
│   │   │   │   ├── nat_temp/
│   │   │   │   ├── storage_temp/
│   │   │   │   ├── two-tier-app/
│   │   │   │   ├── vm_temp/
│   │   │   │   ├── vpc_temp/
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
│   │   │   ├── firewall_temp/
│   │   │   ├── jenkins-private-server-temp/
│   │   │   ├── load-balancer-temp/
│   │   │   ├── mig_temp/
│   │   │   ├── nat_temp/
│   │   │   ├── storage_temp/
│   │   │   ├── two-tier-app/
│   │   │   ├── vm_temp/
│   │   │   ├── vpc_temp/
│   ├── 01-jenkins-learn-appbuild/
│   │   ├── my-app/
│   │   │   ├── src/
│   │   │   │   ├── main/
│   │   │   │   │   ├── java/
│   │   │   │   ├── test/
│   │   │   │   │   ├── java/
├── packer/
│   ├── documentation/
│   ├── readme_templates/
│   ├── scripts/
│   ├── templates/
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
│   │   │   ├── backend/
│   │   │   │   ├── db/
│   │   │   │   ├── routes/
│   │   │   │   ├── services/
│   │   │   ├── docs/
│   │   │   ├── frontend/
│   │   │   │   ├── static/
│   │   │   │   │   ├── css/
│   │   │   │   │   ├── js/
│   │   │   │   ├── templates/
│   │   │   ├── scripts/
│   │   ├── 03-mig-loadbalancer-personal-expense-tracker/
│   ├── python_usecase/
├── revision_plan/
│   ├── documentation/
│   ├── feb-revision-plan.md
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
│   │   ├── vm_temp/
│   │   │   ├── ansible_control_node_vm_temp/
│   │   │   ├── ansible_managed_nodes_vm_temp/
│   │   │   ├── jenkins_master_slave_temp/
│   │   ├── vpc_temp/
```