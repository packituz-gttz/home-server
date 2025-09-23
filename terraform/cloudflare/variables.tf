variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API Token"
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare Account Id"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare Zone Id"
}

variable "admin_dg_email" {
  type        = string
  description = "DG Email allowed on Cloudflare Access Policies"
}

variable "cloudflare_notification_email" {
  type        = string
  description = "Email that will receive notifications"
}

variable "domain" {
  type        = string
  description = "Domain name"
}

variable "server_local_ip" {
  type        = string
  description = "Server ip on local network"
}