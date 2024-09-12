resource "cloudflare_record" "records" {
  for_each = {
    for record in var.records : record.name => record
  }
  name    = each.value.name
  type    = each.value.type
  proxied = each.value.proxied
  value   = var.tunnel_cname
  zone_id = var.zone_id
}

output "records_info" {
  value = cloudflare_record.records
}