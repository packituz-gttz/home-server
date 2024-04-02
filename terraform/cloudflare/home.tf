resource "cloudflare_record" "home" {
  name    = "home"
  type    = "CNAME"
  value   = cloudflare_tunnel.packituz_dev_tunnel.cname
  zone_id = var.cloudflare_zone_id
  proxied = true
}

#resource "cloudflare_tunnel_config" "home_tunnel_config" {
#  tunnel_id  = cloudflare_tunnel.packituz_dev_tunnel.id
#  account_id = var.cloudflare_account_id
#  config {
#    ingress_rule {
#      hostname = cloudflare_record.home.hostname
#      service  = "http://192.168.100.45:8123"
#    }
#    ingress_rule {
#      service = "http_status:404"
#    }
#  }
#}