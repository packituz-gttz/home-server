resource "cloudflare_record" "ntfy" {
  name    = "ntfy"
  type    = "CNAME"
  value   = cloudflare_tunnel.packituz_dev_tunnel.cname
  zone_id = var.cloudflare_zone_id
  proxied = true
}

#resource "cloudflare_tunnel_config" "ntfy_tunnel_config" {
#  tunnel_id  = cloudflare_tunnel.packituz_dev_tunnel.id
#  account_id = var.cloudflare_account_id
#  config {
#    ingress_rule {
#      hostname = cloudflare_record.ntfy.hostname
#      service  = "http://192.168.100.45:8008"
#    }
#    ingress_rule {
#      service = "http_status:404"
#    }
#  }
#}