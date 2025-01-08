project_id = "shyamkprj"

instances = {
  "ansible_managed_node_1" = {
    machine_type = "e2-medium"
    zone         = "northamerica-northeast1"
    image        = "rhel-9"
    network      = "jenkins-test-vpc"
    subnetwork   = "jenkins-test-subnetwork"
    subnetwork_project = "shyamkprj"
    metadata_startup_script = "NA"
  }
  "ansible_managed_node_1" = {
    machine_type = "e2-small"
    zone         = "northamerica-northeast1"
    image        = "debian-cloud/debian-11"
    network      = "jenkins-test-vpc"
    subnetwork   = "jenkins-test-subnetwork"
    subnetwork_project = "shyamkprj"
    metadata_startup_script = "NA"
  }
}

