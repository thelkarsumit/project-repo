terraform {
  backend "gcs" {
    bucket = "sumit-shyamkprj"
    prefix = "terraform/state/cloudsql-mssql"
  }
}