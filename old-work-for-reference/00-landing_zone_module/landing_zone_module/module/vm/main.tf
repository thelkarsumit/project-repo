resource "google_compute_instance" "vm" {
  name          = var.vm_name
  machine_type  = var.machine_type
  zone          = var.zone
  project       = var.project_id
 
  boot_disk {
    initialize_params {
      image     = var.image
    }
  }

  network_interface {
    network         = var.network
    subnetwork      = var.subnetwork 
    subnetwork_project = var.subnetwork_project
    access_config {
      
    }
  }
  metadata_startup_script = var.metadata_startup_script
}