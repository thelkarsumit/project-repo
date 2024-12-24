terraform {
  backend "gcs" {
    bucket = "sumit-shyamkprj"
    prefix = "terraform/state/two-tier-app"
  }
}