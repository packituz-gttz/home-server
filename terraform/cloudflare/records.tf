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