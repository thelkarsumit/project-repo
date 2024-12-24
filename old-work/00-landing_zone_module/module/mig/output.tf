output "instance_template_name" {
  description = "Instance Template Name"
  value       = google_compute_instance_template.template.name
}
output "mig_name" {
  description = "Managed Instance Group Name"
  value       = google_compute_instance_group_manager.mig.name
}
output "vm_count" {
  value = var.target_size
}
output "vm_names" {
  value = [for i in range(var.target_size) : "${google_compute_instance_group_manager.mig.base_instance_name}-${i}"]
}  
/*         
output "load_balancer_ip" {
      value = google_compute_address.lb_ip.address
}
*/
output "google_compute_target_http_proxy" {
  value = google_compute_global_forwarding_rule.forwarding_rule.name
}
output "google_compute_url_map" {
  value = google_compute_url_map.url_map.name
}