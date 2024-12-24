module "mig_module" {
    source = "../../module/mig"
    name_prefix   = var.name_prefix
    machine_type  = var.machine_type
    region        = var.region
    zone          = var.zone
    source_image  = var.source_image
    network       = var.network
    subnetwork = var.subnetwork
    target_size   = var.target_size
}
