resource "cloudflare_record" "depas" {
  name    = "depas"
  type    = "CNAME"
  value   = cloudflare_tunnel.packituz_dev_tunnel.cname
  zone_id = var.cloudflare_zone_id
  proxied = true
}

#resource "cloudflare_tunnel_config" "depas_tunnel_config" {
#  tunnel_id  = cloudflare_tunnel.packituz_dev_tunnel.id
#  account_id = var.cloudflare_account_id
#  config {
#    ingress_rule {
#      hostname = cloudflare_record.depas.hostname
#      service  = "http://192.168.100.45:5001"
#    }
#    ingress_rule {
#      service = "http_status:404"
#    }
#  }
#}

resource "cloudflare_access_application" "depas_app" {
  zone_id = var.cloudflare_zone_id
  name = "Access application for ${cloudflare_record.depas.hostname}"
  domain = cloudflare_record.depas.hostname
  session_duration = "15m"
}

resource "cloudflare_access_policy" "depas_policy" {
  application_id = cloudflare_access_application.depas_app.id
  decision       = "allow"
  name           = "Policy for accessing ${cloudflare_record.depas.hostname}"
  precedence     = 1
  zone_id = var.cloudflare_zone_id
  session_duration = "15m"
  include {
    email = var.cloudflare_admin_emails
  }
}