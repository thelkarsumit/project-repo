name_prefix   = "my-mig"
machine_type  = "e2-medium"
region        = "europe-north1"
zone          = "europe-north1-b"
source_image  = "projects/debian-cloud/global/images/family/debian-11"
network       = "sumit-europe-north1-vpc"
subnetwork    = "sumit-europe-north1-subnet-1"
target_size   = 3
