terraform {
  backend "gcs" {
    bucket = "sumit-shyamkprj"
    prefix = "terraform/state/jenkins-private-server"
  }
}