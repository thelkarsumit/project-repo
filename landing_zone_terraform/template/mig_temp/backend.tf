terraform {
  backend "gcs" {
    bucket = "sumit-shyamkprj"
    prefix = "terraform/state/mig-new"
  }
}