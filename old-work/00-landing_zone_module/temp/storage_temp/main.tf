module "bucket" {
  source = "../../module/storage"
  project_id = var.project_id
  bucket_name = var.bucket_name
  location = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy
  enable_versioning = var.enable_versioning
}