# Variable declaration for VPC
vpc_name = "sumit-europe-north1-vpc"

subnets = [ {
    name                     = "sumit-europe-north1-subnet-1"
    cidr_block               = "10.0.1.0/24"
    region                   = "europe-north1"
    private_ip_google_access = true
  }
  /*,
  {
    name                     = "subnet-2"
    cidr_block               = "10.0.2.0/24"
    region                   = "europe-north1"
    private_ip_google_access = false
  }
  */
] 
