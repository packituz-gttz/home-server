resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.id
  account_id = var.cloudflare_account_id

  config = {
    ingress = [
      {
        hostname = "comics.${var.domain}"
        service  = "http://localhost:5000"
      },
      {
        hostname = "home.${var.domain}"
        service  = "http://localhost:8123"
      },
      {
        hostname = "jelly.${var.domain}"
        service  = "http://localhost:8096"
      },
      {
        hostname = "music.${var.domain}"
        service  = "http://localhost:4533"
      },
      {
        hostname = "notes.${var.domain}"
        service  = "http://localhost:22300"
      },
      {
        hostname = "ntfy.${var.domain}"
        service  = "http://localhost:8008"
      },
      {
        hostname = "ssh.${var.domain}"
        service  = "ssh://localhost:22"
      },
      {
        hostname = "papers.${var.domain}"
        service  = "http://localhost:80"
      },
      {
        hostname = "cars.${var.domain}"
        service  = "http://localhost:80"
      },
      {
        hostname = "grafana.${var.domain}"
        service  = "http://localhost:3000"
      },
      {
        hostname = "share.${var.domain}"
        service  = "http://localhost:3001"
      },
      {
        hostname = "photos.${var.domain}"
        service  = "http://localhost:80"
      },
      {
        hostname = "docs.${var.domain}"
        service  = "http://localhost:80"
      },
      {
        hostname = "apps.${var.domain}"
        service  = "https://localhost"
        origin_request = {
          no_tls_verify = true
        }
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
