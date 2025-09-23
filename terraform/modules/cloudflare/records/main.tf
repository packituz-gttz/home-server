resource "cloudflare_dns_record" "records" {
  for_each = {
    for record in var.records : record.name => record
  }
  name    = each.value.name
  type    = each.value.type
  ttl     = 1
  proxied = each.value.proxied
  content = var.content
  zone_id = var.zone_id
}

output "records_info" {
  value = cloudflare_dns_record.records
}