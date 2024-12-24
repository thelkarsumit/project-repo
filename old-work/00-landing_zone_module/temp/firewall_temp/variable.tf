variable "firewall_rules" {
    description = "Firewall rules to pass to the module"
    type = map(object({
    name          = string
    network       = string
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
}))
}
