vpc_name = "jenkins-test-vpc"
project_id   = "shyamkprj"

subnets = [ {
  name = "jenkins-test-subnetwork"
  cidr_block = "10.0.3.0/29"
  region = "northamerica-northeast1"
  private_ip_google_access = true
} ]

router_name = "jenkins-test-router"
nat_name = "jenkins-test-nat"
router_subnetwork_name = "jenkins-test-subnetwork"
region = "northamerica-northeast1"

firewall_rules = {
      rule1 = {
          name          = "jenkins-test-allow-ssh"
          network       = "jenkins-test-vpc"
          protocol      = "tcp"
          ports         = ["22","3389"]
          source_ranges = ["0.0.0.0/0"]
        }
      rule2 = {
        name          = "jenkins-test-allow-http"
        network       = "jenkins-test-vpc"
        protocol      = "tcp"
        ports         = ["80"]
        source_ranges = ["0.0.0.0/0"]
        }
      rule3 = {
        name          = "jenkins-test-allow-https"
        network       = "jenkins-test-vpc"
        protocol      = "tcp"
        ports         = ["443"]
        source_ranges = ["0.0.0.0/0"]
        }
      rule4 = {
        name          = "jenkins-test-allow-jenkins"
        network       = "jenkins-test-vpc"
        protocol      = "tcp"
        ports         = ["8080"]
        source_ranges = ["0.0.0.0/0"]
        }
}

vm_name = "jenkins-server-test"
machine_type = "e2-medium"
zone         = "northamerica-northeast1-a"
image        = "rhel-9"
vm_subnetwork_name = "jenkins-test-subnetwork"
subnetwork_project = "shyamkprj"
# metadata_startup_script = "${file("/home/thelkar_sumit/landing_zone_module/temp/jenkins-private-server-temp/startup_script.sh")}"