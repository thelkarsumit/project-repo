variable "firewall_rules" {
description = "List of firewall rules to create"
type = map(object({
name          = string
network       = string
protocol      = string
ports         = list(string)
source_ranges = list(string)
    }))
}
                              