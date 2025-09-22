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
      name = "ssh"
    },
    {
      name = "share"
    }
  ]
  zone_id = var.cloudflare_zone_id
}
