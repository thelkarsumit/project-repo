variable "project_id" {
    description = "The ID of the project in which the bucket will be created."
    type        = string
  }
variable "bucket_name" {
      description = "The name of the storage bucket."
      type        = string
  }
variable "location" {
    description = "The location where the bucket will be created (e.g., US, ASIA)."
      type        = string
  }
variable "storage_class" {
    description = "The storage class of the bucket (e.g., STANDARD, NEARLINE, COLDLINE)."
    type        = string
  }
variable "force_destroy" {
    description = "Whether to allow bucket deletion even if it contains objects."
    type        = bool
    default     = false
  }
variable "enable_versioning" {
     description = "Enable versioning for objects in the bucket."
     type        = bool
     default     = false
  }
                                
