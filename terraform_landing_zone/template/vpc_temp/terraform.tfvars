project_id = "sumit-project-05032025"
vpc_name = "vpc-learning-test-001"
subnets = [ 
    {
        name = "subnet-learning-test-africa-south1-public-001"
        cidr_block = "10.10.10.0/29"
        region = "africa-south1"
        private_ip_google_access = false
    },
    {
        name = "subnet-learning-test-europe-west9-management-001"
        cidr_block = "100.100.25.0/28"
        region = "europe-west9"
        private_ip_google_access = true
    }
 ]