# Project Folder Structure

```text
├── .github/
│   ├── config/
│   │   ├── requirements.txt
│   ├── docs/
│   │   ├── 01_intro_to_git.md
│   │   ├── 02_intro_to_github.md
│   │   ├── 03_github_actions_overview.md
│   │   ├── 04_overview_toc_generate_script.md
│   │   ├── 05_terraform-github_secrets-action-setup.md
│   ├── scripts/
│   │   ├── 01_toc_generate_script.py
│   │   ├── 02_toc_generate_script.py
│   ├── workflows/
│   │   ├── 01_update-toc.yml
│   │   ├── 02_terraform-vm-creation_with_github_secrets.yml
│   │   ├── 03_check_python_file_changes.yml
│   │   ├── 04_check_and_run_python_file_changes.yml
├── 00_repo-folder-structure.md
├── README.md
├── ansible/
│   ├── README.md
│   ├── ansible.cfg
│   ├── documentation/
│   │   ├── 01_install_ansible_on_control_node.md
│   │   ├── 02_configure_ssh_key_permissions.md
│   │   ├── 03_ansible_config_inventory_playbook_explanation.md
│   │   ├── 04_roles_usage.md
│   │   ├── 05_ansible_vault_usage_guide.md
│   ├── group_vars/
│   ├── host_vars/
│   ├── inventory/
│   │   ├── development
│   │   ├── production
│   │   ├── staging
│   ├── playbooks/
│   │   ├── 01_update_system.yaml
│   │   ├── 02_install_apache_web_server.yaml
│   │   ├── 03_install_apache_using_roles.yaml
│   │   ├── 04_install_nginx_web_server.yaml
│   │   ├── 05_create_user_playbook.yml
│   │   ├── 06_install_powershell_using_roles.yml
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
│   │   ├── 01_create_user_vault.yml
├── argo-cd/
│   ├── documentation/
│   │   ├── 01_what_is_argo_cd.md
│   │   ├── 02_how_to_install_argo_cd.md
│   │   ├── 03_troubleshooting_argo_cd_installation.md
│   │   ├── 04_how_to_use_argo_cd.md
│   │   ├── 05_argo_cd_and_devops_tools_integration.md
│   │   ├── 06_argo_cd_best_practices.md
│   │   ├── 07_argo_cd_applications_management.md
│   │   ├── 08_argo_cd_monitoring_and_logging.md
│   │   ├── 09_argo_cd_security.md
│   │   ├── 10_argo_cd_advanced_features.md
├── azure/
│   ├── active_directory_docs/
│   │   ├── 00_tableofcontent.md
│   │   ├── 01_introduction_to_ad.md
│   │   ├── 02_installing_and_configuring_ad.md
│   │   ├── 03_ad_structures_and_hierarchies.md
│   │   ├── 04_user_and_group_management.md
│   │   ├── 05_group_policies_and_organizational_units.md
│   │   ├── 06_ad_dns_integration.md
│   │   ├── 07_ad_replication_and_sites.md
│   │   ├── 08_ad_trust_relationships.md
│   │   ├── 09_ad_security_and_permissions.md
│   │   ├── 10_backup_and_recovery_in_ad.md
│   │   ├── 11_scripting_and_automation_with_powershell.md
│   │   ├── 12_troubleshooting_active_directory.md
│   │   ├── 13_ad_auditing_and_monitoring.md
│   │   ├── 14_active_directory_integration_with_cloud.md
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
│   │   ├── advanced.md
│   │   ├── basic.md
│   │   ├── intermediate.md
│   ├── documentation/
│   │   ├── 01_what_is_docker.md
│   │   ├── 02_how_to_install_docker.md
│   │   ├── 03_how_to_write_dockerfile.md
│   │   ├── 04_how_to_build_docker_images.md
│   │   ├── 05_how_to_use_docker_commands.md
│   │   ├── 06_docker_compose_basics.md
│   │   ├── 07_docker_networking_and_volumes.md
│   │   ├── 08_docker_security_best_practices.md
│   │   ├── 09_integration_with_devops_tools.md
│   │   ├── 10_troubleshooting_docker.md
├── google-kubernetes-engine/
│   ├── documentation/
│   │   ├── 01_what_is_gke_and_types.md
│   │   ├── 02_gke_architecture.md
│   │   ├── 03_how_to_create_gke.md
│   │   ├── 04_how_managed_gke_network_works.md
│   │   ├── 05_how_to_write_manifest_yaml_for_deployment.md
│   ├── manifest_files/
│   │   ├── advanced.md
│   │   ├── basic.md
│   │   ├── intermediate.md
├── jenkins/
│   ├── docker-images-cicd-pipeline/
│   │   ├── Hello_world_docker_image/
│   │   │   ├── src/
│   │   │   │   ├── main/
│   │   │   │   │   ├── java/
│   │   ├── my-website-docker/
│   ├── documentation/
│   │   ├── 01_what_is_jenkins.md
│   │   ├── 02_how_to_install_jenkins.md
│   │   ├── 03_how_to_write_jenkinsfile.md
│   │   ├── 04_jenkins_usage.md
│   │   ├── 05_jenkins_integration_with_devops_tools.md
│   │   ├── 06_jenkins_pipeline_example.md
│   │   ├── 07_jenkins_plugins.md
│   │   ├── 08_jenkins_security.md
│   │   ├── 09_master_slave_architecture_jenkins.md
│   ├── terraform-cicd-pipeline/
│   │   ├── jenkinsfile-vmcreate
│   │   ├── jenkinsfile-vmdestroy
│   │   ├── jenkinsfile-with-paramter
│   │   ├── jenkinsfile-with-paramter-save-gcs-bucket
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
│   │   ├── 01_intro_to_packer.md
│   │   ├── 02_packer_installation.md
│   │   ├── 03_packer_template_structure.md
│   │   ├── 04_packer_with_gcp.md
│   │   ├── 05_packer_with_azure.md
│   │   ├── 06_packer_with_aws.md
│   │   ├── 07_integration_with_cloud_providers.md
│   │   ├── 08_packer_workflow.md
│   │   ├── 09_troubleshooting_packer.md
│   │   ├── 10_advanced_packer_usage.md
│   ├── readme_templates/
│   │   ├── 01_create_vm_image_gcp.md
│   │   ├── 02_create_vm_image_azure.md
│   │   ├── 03_create_vm_image_aws.md
│   │   ├── 04_create_ubuntu_image_gcp.md
│   │   ├── 05_create_windows_image_gcp.md
│   │   ├── 06_integration_with_gcp_azure_aws.md
│   ├── scripts/
│   │   ├── 01_packer-install-devops-tools.sh
│   ├── templates/
│   │   ├── 01_create_vm_image_gcp.json
│   │   ├── 02_create_vm_image_azure.json
│   │   ├── 03_create_vm_image_aws.json
│   │   ├── 04_create_ubuntu_image_gcp.json
│   │   ├── 05_create_windows_image_gcp.json
│   │   ├── 06_integration_with_gcp_azure_aws.json
│   │   ├── 07_advanced_custom_images.json
│   │   ├── 07_advanced_custom_images.md
├── powershell/
│   ├── documentation/
│   │   ├── 01_what_is_powershell.md
│   │   ├── 02_how_to_install_powershell.md
│   │   ├── 03_powershell_cmdlets_basics.md
│   │   ├── 04_script_examples_file_operations.md
│   │   ├── 05_gcp_resource_management_powershell.md
│   │   ├── 06_gcp_vm_creation_script.md
│   │   ├── 07_ad_basics_using_powershell.md
│   │   ├── 08_ad_user_management.md
│   │   ├── 09_ad_group_and_ou_management.md
│   │   ├── 10_ad_automation_scripts.md
│   ├── powershell_scripts_for_GCP_tasks/
│   │   ├── 00_powershell_commands_overview.md
│   │   ├── 01_set_gcp_project_cloudshell.ps1
│   │   ├── 02_create_gcp_vm.ps1
│   │   ├── 03_delete_gcp_vm.ps1
│   │   ├── task_list.md
├── python_learning/
│   ├── documentation/
│   │   ├── 01_intro_to_python_basics.md
│   │   ├── 02_variables_and_data_types.md
│   │   ├── 03_control_structures.md
│   │   ├── 04_functions_and_modules.md
│   │   ├── 05_error_handling_and_debugging.md
│   │   ├── 06_working_with_files.md
│   │   ├── 07_python_libraries_and_packages.md
│   │   ├── 08_oop_in_python.md
│   │   ├── 09_advanced_python_features.md
│   │   ├── 10_python_and_gcp_basics.md
│   │   ├── 11_python_scripts_for_gcp.md
│   │   ├── 12_advanced_python_and_gcp_integration.md
│   │   ├── 13_testing_and_deployment_in_python.md
│   │   ├── 14_best_practices_in_python.md
│   │   ├── 15_python_for_devops.md
│   ├── gcp_python_projects/
│   │   ├── 00_folder_structure_overview.md
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
│   │   ├── 00_python_tasks_list.md
│   │   ├── 01_divisible_by_7_and_9.py
│   │   ├── 02_data_types.py
│   │   ├── 03_string_manipulation.py
│   │   ├── 04_input_output.py
│   │   ├── 05_arithmetic_operations.py
│   │   ├── 07_for_loop.py
│   │   ├── 08_while_loop.py
│   │   ├── 09_break_continue.py
│   │   ├── 10_list_operations.py
│   │   ├── 11_tuple_operations.py
│   │   ├── 12_dict_operations.py
│   │   ├── 13_set_operations_with_explanation.py
│   │   ├── 14_list_comprehension.py
│   │   ├── 15_dict_comprehension.py
│   │   ├── 16_lambda_functions.py
│   │   ├── 17_map_filter.py
├── revision_plan/
│   ├── documentation/
│   │   ├── 00_learning-note.md
│   │   ├── 01_networking_concepts_overview.md
│   │   ├── 02_gcp_mig_umig_load_balancer_comparison.md
│   │   ├── 03_gcp_database_services.md
│   │   ├── 04_deployment_project_explain_ci_cd_pipeline.md
│   ├── feb-revision-plan.md
│   ├── images/
│   │   ├── Key Differences Between IPv4 and IPv6.png
│   │   ├── Structured or semi-structured data image1.png
│   │   ├── Structured or semi-structured data image2.png
│   │   ├── Summary table for classful IP addressing.png
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