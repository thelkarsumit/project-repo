# Revision Agenda

## 1. 9 Dec (Monday)
- **1:** Google Cloud Storage with manual and Terraform module.
- **2:** Storage/Database overview.

## 2. 10 Dec (Tuesday)
- **1:** Creating VPC and 2 subnets using a single VPC module (for map/list-variable or multiple resource creation using a single module and in one-time temp running).
- **2:** Creating Firewall Rule for SSH, IAP, and HTTPS.
- **3:** Private VM creation and accessing this VM through CLI and IAP Desktop by applying NAT and firewall rule.
   - vpc > router > nat > firewall rule > vm > ssh.

## 3. 11 Dec (Wednesday)
- **1:** Revising with Vinay (Basics of networking, VPC, etc.).
- **2:** Revising template, MIG and UMIG, load balancer.
- **3:** Creation of MIG using console and Terraform.
- **4:** Creation of Load balancer with console and Terraform.
- **5:** Doc learning SQL (Understanding what topics need to learn for RHEL).

## 4. 12 Dec (Thursday)
- **1:** Git Learning – Revising git commands, concepts.
- **2:** Doc work for RHEL (Start working on doc content / Completed till point no 4 (Requestable Items)).

## 5. 13 Dec (Friday)
- **1:** Creating cloud SQL using console and Terraform.
- **2:** Doc work for RHEL (Completed except Point no 8,9,10).
---
## 6. 16 Dec (Monday)
- **1:** Discussed the document with Karan/Vinay and working on it.
- **2:** Revise all technical things learned in the last week.
- **3:** Revise Jenkins.
- **4:** Work on Jenkins installation and accessing it.

## 7. 17 Dec (Tuesday)
- **1:** Discussed the document with Amit Sir, Karan, Vinay, and working on it.
- **2:** Started on creation of job and integrating with different tools.

## 8. 18 Dec (Wednesday)
- **1:** Discussed the document with Karan/Vinay and almost completed.
- **2:** Created 2-tier application with modules.

## 9. 19 Dec (Thursday)
- **1:** Discussed the document with Karan/Vinay and almost completed.
- **2:** Created Jenkins server using Terraform module and metadata script and trying to access it using private VM.

## 10. 20 Dec (Friday)
- **1:** Discussed the document with Karan/Vinay and completed.
- **2:** Revise Jenkins and understand folder structure, access part, plugins, and job creation while integration with GitHub.
---
## 11. 23 Dec (Monday)
- **1:** Learning how to create and manage GCP resources using Terraform and Jenkins, while ensuring the Git code remains up-to-date with contributions from different team members' CI/CD pipelines.
- **2:** A Jenkins job has been created to automate the creation and destruction of a VM on GCP using Terraform and Terraform modules.

## 12. 24 Dec (Tuesday)
- **1:** Created a Jenkins CI/CD pipeline to automate the provisioning and decommissioning of GCP resources using Terraform. 
  - The pipeline takes parameters to define the action (create or destroy) and the path to the Terraform template. 
  - It simplifies infrastructure management by dynamically applying or removing resources based on the given inputs.
- **2:** Trying to store Jenkins console output to GCS bucket.
---
## 13. 30 Dec (Monday)
- **1:** Revise all points learned till last week.
- **2:** Start learning and working on GCP monitoring.

## 14. 31 Dec (Tuesday)
- **1:** Revise all points learned till last week.
- **2:** Work on GCP monitoring and trying to understand Terraform code for the same.

## 15. 2 Jan (Thursday)
- **1:** Revise all points learned till last week.
- **2:** Try to understand the Terraform code, folder structure for GCP monitoring, and implement monitoring using Terraform.

## 16. 3 Jan (Friday)
- **1:** Revise all points learned till last week.
- **2:** Working on Jenkins to create different resources with the same pipeline.
--- 
## 17. 6 Jan (Monday)
- **1:** Start revising Docker concept.
- **2:** Working on Dockerfile creation and image creation using Docker.

## 18. 7 Jan (Tuesday)
- **1:** Created a Dockerfile and using it to build a Docker image.
- **2:** Created a Jenkins pipeline using this pipeline to create a Docker image and push it to GCP Repository.

## 19. 8 Jan (Wednesday)
- **1:** Started learning Ansible.
- **2:** Created an Ansible VM using Terraform and Jenkins and learned how to create multiple VMs using for-each and create a control and managed VM using it.
- **3:** Started configuring Ansible control VM.

## 20. 9 Jan (Thursday)
- **1:** Create Ansible VM using Jenkins, Terraform, and auto-install Ansible while creating it.
- **2:** Working on Ansible configuration.
- **3:** Trying to make a connection between control VM and managed VM and troubleshoot errors coming in this task.
- **4:** Documented all Ansible learning.
## 21. 10 Jan (Friday )
- **1:** Create a new managed VM and try to make connectivity between control and new managed VM.
- **2:** Once connectivity is built, run Ansible playbooks on the managed VM and document troubleshooting errors for this task.
- **3:** Revise all about Ansible and try to understand how to use Ansible and Jenkins one time.
---
## 22. 13  (Monday)
- **1:** Revised ansible , learn till last weak. 
- **2:** Learn more about ansible roles ,vaults, playbooks. 
- **3:** Documentated ansible,jenskins,docker. 
## 23. 14 Jan (Tuesday)
- **1:** Revised networking,mig,umig,load balancer.
- **2:** Revised terraform code for this topices.
- **3:** Documentated networking,mig,umig,load balancer revision points. 
## 24. 15 Jan (Wednesday)
- **1:** Revised basic networking and GKE Architecture. 
- **2:** Completed labs on Security Foundation *(Course:Security & Identity Fundamentals:First 4 labs)*
- **4:** Documentated basic networking and GKE Architecture. 
## 24. 16 Jan (Thursday)
- **1:** Completed labs on Security Foundation *(Course:Security & Identity Fundamentals:Next 3 labs)*
- **2:** Work on Jenkins master slave architecture.
- **3:** Created a role to install Powershell and install on ansible managed vm.
- **4:** Started working on PowerShell commands.
- **5:** Documentated jenkins master slave architecture and powershell working.
## 24. 17 Jan (Friday)
- **1:** Completed labs on Security Foundation *(Course:Security & Identity Fundamentals:Next 2 labs)* 
- **2:** Understanding more about powershell commands 
- **3:** Documentated powershell working.
---
## 25. 20 Jan (Monday)
- **1:** Started learing about python.
- **2:** Understand about python project folder structure.
- **3:** Documentated python learning
## 25. 21 Jan (Tuesday) 
- **1:** Learn about powershell usecase. 
- **2:** Work on topics / usecase list creation and understanding powershell code.
- **3:** Documentated powershell learning
## 25. 22 Jan (Wednesday)
- **1:** Leave
## 25. 23 Jan (Thursday)
- **1:** Learn python usecase. 
- **2:** Documentated python learning
## 25. 24 Jan (Friday)
- **1:** learning more about python and powershell usecase.




---


    