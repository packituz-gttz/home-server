resource "cloudflare_page_rule" "packituz_dev_cache_rule" {
  zone_id = var.cloudflare_zone_id

  status = "active"
  target = "*.packituz.dev/"
  priority = 1

  actions {
    cache_level = "bypass"
    disable_performance = true
  }
}