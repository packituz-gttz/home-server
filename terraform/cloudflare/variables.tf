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

variable "cloudflare_admin_emails" {
  type        = list(string)
  description = "Emails allowed on Cloudflare Access Policies"
}

variable "cloudflare_notification_email" {
  type        = string
  description = "Email that will receive notifications"
}

variable "server_local_ip" {
  type        = string
  description = "Server ip on local network"
}