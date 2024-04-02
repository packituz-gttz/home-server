resource "cloudflare_record" "jelly" {
  name    = "jelly"
  type    = "CNAME"
  value   = cloudflare_tunnel.packituz_dev_tunnel.cname
  zone_id = var.cloudflare_zone_id
  proxied = true
}

#resource "cloudflare_tunnel_config" "jelly_tunnel_config" {
#  tunnel_id  = cloudflare_tunnel.packituz_dev_tunnel.id
#  account_id = var.cloudflare_account_id
#  config {
#    ingress_rule {
#      hostname = cloudflare_record.jelly.hostname
#      service  = "http://192.168.100.45:8096"
#    }
#    ingress_rule {
#      service = "http_status:404"
#    }
#  }
#}