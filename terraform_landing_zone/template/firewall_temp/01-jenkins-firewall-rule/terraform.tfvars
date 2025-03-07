project_id = "sumit-project-05032025"

firewall_rules = {
  "rule1" = {
    name = "jenkins-allow-ssh"
    network = "vpc-learning-test-001"
    protocol      = "tcp"
    ports         = ["22","3389"]
    source_ranges = ["35.235.240.0/20"]
  },
  rule2 = {
    name          = "jenkins-allow-http"
    network       = "vpc-learning-test-001"
    protocol      = "tcp"
    ports         = ["80"]
    source_ranges = ["0.0.0.0/0"]
  },
  rule3 = {
    name          = "jenkins-allow-https"
    network       = "vpc-learning-test-001"
    protocol      = "tcp"
    ports         = ["443"]
    source_ranges = ["0.0.0.0/0"]
  },
  rule4 = {
    name          = "jenkins-allow-jenkins"
    network       = "vpc-learning-test-001"
    protocol      = "tcp"
    ports         = ["8080"]
    source_ranges = ["0.0.0.0/0"]
  }
}