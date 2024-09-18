module "records" {
  source       = "../modules/cloudflare/records"
  tunnel_cname = cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.cname
  records = [
    {
      name = "comics"
    },
    {
      name = "depas"
    },
    {
      name = "grafana"
    },
    {
      name = "home"
    },
    {
      name = "jelly"
    },
    {
      name = "music"
    },
    {
      name = "notes"
    },
    {
      name = "ntfy"
    },
    {
      name = "ssh"
    }
  ]
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_zero_trust_access_application" "depas_app" {
  zone_id          = var.cloudflare_zone_id
  name             = "Access application for ${module.records.records_info["depas"].hostname}"
  domain           = module.records.records_info["depas"].hostname
  session_duration = "15m"
  type             = "self_hosted"
}

resource "cloudflare_zero_trust_access_policy" "depas_policy" {
  decision       = "allow"
  name           = "Policy for accessing ${module.records.records_info["depas"].hostname}"
  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_zero_trust_access_application.depas_app.id
  precedence     = 1
  include {
    email = var.cloudflare_admin_emails
  }
}