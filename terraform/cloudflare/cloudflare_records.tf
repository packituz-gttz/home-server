module "records" {
  source       = "../modules/cloudflare/records"
  tunnel_cname = cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.cname
  records = [
    {
      name = "comics"
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
      name = "papers"
    },
    {
      name = "ssh"
    },
    {
      name = "share"
    }
  ]
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_zero_trust_access_application" "papers_app" {
  zone_id          = var.cloudflare_zone_id
  name             = "Access application for ${module.records.records_info["papers"].hostname}"
  domain           = module.records.records_info["papers"].hostname
  session_duration = "60m"
  type             = "self_hosted"
}

resource "cloudflare_zero_trust_access_policy" "papers_policy" {
  decision       = "allow"
  name           = "Policy for accessing ${module.records.records_info["papers"].hostname}"
  zone_id        = var.cloudflare_zone_id
  application_id = cloudflare_zero_trust_access_application.papers_app.id
  precedence     = 1
  include {
    email = var.cloudflare_admin_emails
  }
}