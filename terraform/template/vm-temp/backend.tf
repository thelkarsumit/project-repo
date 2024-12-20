terraform {
  backend "gcs" {
    bucket = "sumit-shyamkprj"
    prefix = "terraform/state/jenkins/vm-creation-test"
  }
}