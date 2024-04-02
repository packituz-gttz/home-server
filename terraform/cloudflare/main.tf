resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_tunnel" "packituz_dev_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "packituz-dev-tunnel"
  secret     = base64sha256(random_password.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_bot_management" "bot_management" {
  zone_id = var.cloudflare_zone_id
  enable_js = true
  fight_mode = true
}