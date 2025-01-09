resource "google_compute_address" "lb_ip" {
  name = "${var.name_prefix}-lb-ip"
}
resource "google_compute_health_check" "http_health_check" {
  name               = "${var.name_prefix}-http-health-check"
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 3

  http_health_check {
  port = 80
  }
}

resource "google_compute_backend_service" "backend_service" {
  name        = "${var.name_prefix}-backend-service"
  health_checks = [google_compute_health_check.http_health_check.self_link]
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

  backend {
  group = google_compute_instance_group_manager.mig.instance_group
  }
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.name_prefix}-url-map"
  default_service = google_compute_backend_service.backend_service.self_link
  }

resource "google_compute_target_http_proxy" "http_proxy" {
  name   = "${var.name_prefix}-http-proxy"
  url_map = google_compute_url_map.url_map.self_link
  }

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "${var.name_prefix}-forwarding-rule"
  ip_address = google_compute_address.lb_ip.address
  ip_protocol = "TCP"
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.self_link
}
              