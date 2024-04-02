resource "cloudflare_record" "admin" {
  name    = "admin"
  type    = "CNAME"
  value   = cloudflare_tunnel.packituz_dev_tunnel.cname
  zone_id = var.cloudflare_zone_id
  proxied = true
}

resource "cloudflare_access_application" "admin_app" {
  zone_id = var.cloudflare_zone_id
  name = "Access application for ${cloudflare_record.admin.hostname}"
  domain = cloudflare_record.admin.hostname
  session_duration = "6h"
}

resource "cloudflare_access_policy" "admin_policy" {
  application_id = cloudflare_access_application.admin_app.id
  decision       = "allow"
  name           = "Policy for accessing ${cloudflare_record.admin.hostname}"
  precedence     = 1
  session_duration = "6h"
  zone_id = var.cloudflare_zone_id
  include {
    email = var.cloudflare_admin_emails
  }
}