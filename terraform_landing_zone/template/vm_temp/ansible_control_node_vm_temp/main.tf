module "vm" {
  source = "../../../module/vm"
  vm_name = var.vm_name
  machine_type = var.machine_type
  zone = var.zone
  project_id = var.project_id
  image = var.image
  network = var.network
  subnetwork = var.subnetwork
  subnetwork_project = var.subnetwork_project
  metadata_startup_script = var.metadata_startup_script
}