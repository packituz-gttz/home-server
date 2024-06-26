resource "cloudflare_tunnel_config" "tunnel_config" {
  tunnel_id  = cloudflare_tunnel.packituz_dev_tunnel.id
  account_id = var.cloudflare_account_id
  config {
    ingress_rule {
      hostname = cloudflare_record.admin.hostname
      service  = "https://192.168.100.45:9090"
      origin_request {
        no_tls_verify = true
      }

    }

    ingress_rule {
      hostname = cloudflare_record.comics.hostname
      service  = "http://192.168.100.45:5000"
    }

    ingress_rule {
      hostname = cloudflare_record.depas.hostname
      service  = "http://192.168.100.45:5001"
    }

    ingress_rule {
      hostname = cloudflare_record.home.hostname
      service  = "http://192.168.100.45:8123"
    }

    ingress_rule {
      hostname = cloudflare_record.jelly.hostname
      service  = "http://192.168.100.45:8096"
    }

    ingress_rule {
      hostname = cloudflare_record.music.hostname
      service  = "http://192.168.100.45:4533"
    }

    ingress_rule {
      hostname = cloudflare_record.notes.hostname
      service  = "http://192.168.100.45:22300"
    }

    ingress_rule {
      hostname = cloudflare_record.ntfy.hostname
      service  = "http://192.168.100.45:8008"
    }

    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_notification_policy" "tunnel_notification" {
  account_id  = var.cloudflare_account_id
  alert_type  = "tunnel_health_event"
  enabled     = true
  name        = "${cloudflare_tunnel.packituz_dev_tunnel.name} Tunnel Alert"
  description = "Alert for ${cloudflare_tunnel.packituz_dev_tunnel.name} tunnel health"
  email_integration {
    id = var.cloudflare_notification_email
  }

  filters {
    tunnel_id  = [cloudflare_tunnel.packituz_dev_tunnel.id]
    new_status = ["TUNNEL_STATUS_TYPE_DOWN", "TUNNEL_STATUS_TYPE_HEALTHY"]
  }
}
