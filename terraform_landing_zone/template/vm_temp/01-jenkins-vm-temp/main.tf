provider "google" {
  project = var.project_id
  credentials = file("../../../../../sumit-project-05032025-network-admin.json")
}
module "Jenkins-VM" {
  source = "../../../module/vm"
  vm_name = var.vm_name
  machine_type = var.machine_type
  zone = var.zone
  image = var.image
  project_id = var.project_id
  network = var.network
  subnetwork = var.subnetwork
  subnetwork_project = var.subnetwork_project
  metadata_startup_script = var.metadata_startup_script
}