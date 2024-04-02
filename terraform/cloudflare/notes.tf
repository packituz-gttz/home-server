resource "cloudflare_record" "notes" {
  name    = "notes"
  type    = "CNAME"
  value   = cloudflare_tunnel.packituz_dev_tunnel.cname
  zone_id = var.cloudflare_zone_id
  proxied = true
}

#resource "cloudflare_tunnel_config" "notes_tunnel_config" {
#  tunnel_id  = cloudflare_tunnel.packituz_dev_tunnel.id
#  account_id = var.cloudflare_account_id
#  config {
#    ingress_rule {
#      hostname = cloudflare_record.notes.hostname
#      service  = "http://192.168.100.45:22300"
#    }
#    ingress_rule {
#      service = "http_status:404"
#    }
#  }
#}