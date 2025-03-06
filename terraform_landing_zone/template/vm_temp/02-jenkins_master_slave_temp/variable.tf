variable "instances" {
  type = map(object({
    machine_type = string
    image = string
    zone = string
    network = string
    subnetwork = string
    subnetwork_project = string
    metadata_startup_script = string 
  }))
}
variable "project_id" {
 type = string
}