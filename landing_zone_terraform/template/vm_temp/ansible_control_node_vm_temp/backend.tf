terraform {
  backend "gcs" {
    bucket = "value"
    prefix = "terraform/state/ansible/control-node"
  }
}