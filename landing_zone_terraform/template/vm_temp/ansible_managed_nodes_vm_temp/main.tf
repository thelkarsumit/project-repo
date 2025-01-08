module "vm" {
    source = "../../../module/vm"
    for_each = var.instances
    vm_name = each.key
    machine_type = each.value.machine_type
    image = each.value.image
    zone = each.value.zone
    project_id = var.project_id
    network = each.value.network
    subnetwork = each.value.subnetwork
    subnetwork_project = each.value.subnetwork_project
    metadata_startup_script = each.value.metadata_startup_script
}