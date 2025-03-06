output "vpc_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "subnet_names" {
  description = "List of subnet names"
  value       = [for subnet in google_compute_subnetwork.subnets : subnet.name]
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = [for subnet in google_compute_subnetwork.subnets : subnet.id]
}

output "subnet_ip_availability" {
  value = [
    for idx, subnet in var.subnets : {
      name           = subnet.name
      cidr_block     = subnet.cidr_block
      subnet_mask    = tonumber(split("/", subnet.cidr_block)[1])  # Extract subnet mask
      total_ips      = pow(2, (32 - tonumber(split("/", subnet.cidr_block)[1])))  
      available_ips  = pow(2, (32 - tonumber(split("/", subnet.cidr_block)[1]))) - 2  
    }
  ]
}
