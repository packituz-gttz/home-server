resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.id
  account_id = var.cloudflare_account_id

  config = {
    ingress = [
      {
        hostname = "comics.${var.domain}"
        service  = "http://${var.server_local_ip}:5000"
      },
      {
        hostname = "home.${var.domain}"
        service  = "http://${var.server_local_ip}:8123"
      },
      {
        hostname = "jelly.${var.domain}"
        service  = "http://${var.server_local_ip}:8096"
      },
      {
        hostname = "music.${var.domain}"
        service  = "http://${var.server_local_ip}:4533"
      },
      {
        hostname = "notes.${var.domain}"
        service  = "http://${var.server_local_ip}:22300"
      },
      {
        hostname = "ntfy.${var.domain}"
        service  = "http://${var.server_local_ip}:8008"
      },
      {
        hostname = "ssh.${var.domain}"
        service  = "ssh://${var.server_local_ip}:22"
      },
      {
        hostname = "papers.${var.domain}"
        service  = "http://${var.server_local_ip}:8887"
      },
      {
        hostname = "cars.${var.domain}"
        service  = "http://${var.server_local_ip}:8889"
      },
      {
        hostname = "grafana.${var.domain}"
        service  = "http://${var.server_local_ip}:3000"
      },
      {
        hostname = "share.${var.domain}"
        service  = "http://${var.server_local_ip}:3001"
      },
      {
        hostname = "photos.${var.domain}"
        service  = "http://${var.server_local_ip}:8001"
      },
      {
        hostname = "docs.${var.domain}"
        service  = "http://${var.server_local_ip}:3003"
      },
      {
        hostname = "apps.${var.domain}"
        service  = "https://${var.server_local_ip}"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

resource "cloudflare_notification_policy" "tunnel_notification" {
  account_id  = var.cloudflare_account_id
  alert_type  = "tunnel_health_event"
  enabled     = true
  name        = "${cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.name} Tunnel Alert"
  description = "Alert for ${cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.name} tunnel health"
  mechanisms = {
    email = [
      {
        id = var.cloudflare_notification_email
      }
    ]
  }

  filters = {
    tunnel_id  = [cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.id]
    new_status = ["TUNNEL_STATUS_TYPE_DOWN", "TUNNEL_STATUS_TYPE_HEALTHY"]
  }
}
