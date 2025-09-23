variable "zone_id" {
  type        = string
  description = "Zone ID"
}

variable "content" {
  type        = string
  description = "Cloudflare tunnel CNAME"
}

variable "records" {
  type = list(object({
    name    = string
    type    = optional(string, "CNAME")
    proxied = optional(bool, true)
  }))
}