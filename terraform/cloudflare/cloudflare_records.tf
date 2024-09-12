module "records" {
  source       = "../modules/cloudflare/records"
  tunnel_cname = cloudflare_tunnel.packituz_dev_tunnel.cname
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

resource "cloudflare_access_application" "depas_app" {
  zone_id          = var.cloudflare_zone_id
  name             = "Access application for ${module.records.records_info["depas"].hostname}"
  domain           = module.records.records_info["depas"].hostname
  session_duration = "15m"
}

resource "cloudflare_access_policy" "depas_policy" {
  application_id   = cloudflare_access_application.depas_app.id
  decision         = "allow"
  name             = "Policy for accessing ${module.records.records_info["depas"].hostname}"
  precedence       = 1
  zone_id          = var.cloudflare_zone_id
  session_duration = "15m"
  include {
    email = var.cloudflare_admin_emails
  }
}