resource "google_monitoring_alert_policy" "cpu_utilization" {
  display_name          = "High CPU Utilization Alert"
  notification_channels = [google_monitoring_notification_channel.email.id]

  conditions {
    display_name = "High CPU Utilization"
    condition_threshold {
      comparison         = "COMPARISON_GT"
      threshold_value    = 80
      filter             = "resource.type=\"gce_instance\" AND metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\""
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
      duration = "60s"  # Specifies how long the condition must be met before triggering the alert
    }
  }

  # Specify the 'combiner' to define how the conditions are combined.
  combiner = "AND"  # Options: "AND" or "OR"

  # You may also need to specify the notification settings, such as notification channels.
}
