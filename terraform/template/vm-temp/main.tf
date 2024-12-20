module "vm" {
  source = "../../vm"
  vm_name = var.vm_name
  mahine_type = var.machine_type
  zone = var.zone
  project = var.project_id
  image = var.image
  network = var.network
  subnetwork = var.subnetwork
  subnetwork_project = var.subnetwork_project
}