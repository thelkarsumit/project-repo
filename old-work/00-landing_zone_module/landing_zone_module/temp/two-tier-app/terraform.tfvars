vpc_name = "two-tier-app-vpc"
subnets = [ {
  name = "two-tier-app-subnet-1"
  cidr_block = "10.0.2.0/24"
  region                   = "asia-south2"
  private_ip_google_access = true  
} ]

router_name = "two-tier-app-router"
nat_name = "two-tier-app-nat"
region = "asia-south2"
zone = "asia-south2-a"
network = "two-tier-app-vpc"
subnetwork_name = "two-tier-app-subnet-1"
machine_type = "e2-medium"
source_image = "projects/debian-cloud/global/images/family/debian-11"

firewall_rules = {
    two-tier-app-allow-ssh = {
    name          = "two-tier-app-allow-ssh"
    network       = "two-tier-app-vpc"
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
    }
    two-tier-app-allow-http = {
        name          = "two-tier-app-allow-http"
        network       = "two-tier-app-vpc"
        protocol      = "tcp"
        ports         = ["80"]
        source_ranges = ["0.0.0.0/0"]
        }
    two-tier-app-allow-https = {
        name          = "two-tier-app-allow-https"
        network       = "two-tier-app-vpc"
        protocol      = "tcp"
        ports         = ["443"]
        source_ranges = ["0.0.0.0/0"]
        }
}

name_prefix = "two-tier-app"
target_size = "3"