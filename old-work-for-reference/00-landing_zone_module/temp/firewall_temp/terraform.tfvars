firewall_rules = {
      rule1 = {
          name          = "sumit-allow-ssh"
          network       = "sumit-europe-north1-vpc"
          protocol      = "tcp"
          ports         = ["22","3389"]
          source_ranges = ["0.0.0.0/0"]
        }
      rule2 = {
        name          = "sumit-allow-http"
        network       = "sumit-europe-north1-vpc"
        protocol      = "tcp"
        ports         = ["80"]
        source_ranges = ["0.0.0.0/0"]
        }
      rule3 = {
        name          = "sumit-allow-https"
        network       = "sumit-europe-north1-vpc"
        protocol      = "tcp"
        ports         = ["443"]
        source_ranges = ["0.0.0.0/0"]
        }
      rule4 = {
        name          = "sumit-allow-jenkins"
        network       = "sumit-europe-north1-vpc"
        protocol      = "tcp"
        ports         = ["8080"]
        source_ranges = ["0.0.0.0/0"]
        }
}
