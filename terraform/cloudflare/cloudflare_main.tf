resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "packituz_dev_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "packituz-dev-tunnel"
  secret     = base64sha256(random_password.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_page_rule" "packituz_dev_cache_rule" {
  zone_id = var.cloudflare_zone_id

  status   = "active"
  target   = "*.packituz.dev/"
  priority = 1

  actions {
    cache_level         = "bypass"
    disable_performance = true
  }
}