variable "zone_id" {
  type        = string
  description = "Zone ID"
}


variable "tunnel_cname" {
  type        = string
  description = "Tunnel name"
}


variable "records" {
  type = list(object({
    name    = string
    type    = optional(string, "CNAME")
    proxied = optional(bool, true)
  }))
}