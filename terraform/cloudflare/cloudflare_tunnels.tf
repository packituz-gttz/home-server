resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.id
  account_id = var.cloudflare_account_id
  config {

    ingress_rule {
      hostname = module.records.records_info["comics"].hostname
      service  = "http://${var.server_local_ip}:5000"
    }

    ingress_rule {
      hostname = module.records.records_info["home"].hostname
      service  = "http://${var.server_local_ip}:8123"
    }

    ingress_rule {
      hostname = module.records.records_info["jelly"].hostname
      service  = "http://${var.server_local_ip}:8096"
    }

    ingress_rule {
      hostname = module.records.records_info["music"].hostname
      service  = "http://${var.server_local_ip}:4533"
    }

    ingress_rule {
      hostname = module.records.records_info["notes"].hostname
      service  = "http://${var.server_local_ip}:22300"
    }

    ingress_rule {
      hostname = module.records.records_info["ntfy"].hostname
      service  = "http://${var.server_local_ip}:8008"
    }

    ingress_rule {
      hostname = module.records.records_info["ssh"].hostname
      service  = "ssh://${var.server_local_ip}:22"
    }

    ingress_rule {
      hostname = module.records.records_info["grafana"].hostname
      service  = "http://${var.server_local_ip}:3000"
    }

    ingress_rule {
      hostname = module.records.records_info["share"].hostname
      service  = "http://${var.server_local_ip}:3001"
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
  name        = "${cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.name} Tunnel Alert"
  description = "Alert for ${cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.name} tunnel health"
  email_integration {
    id = var.cloudflare_notification_email
  }

  filters {
    tunnel_id  = [cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.id]
    new_status = ["TUNNEL_STATUS_TYPE_DOWN", "TUNNEL_STATUS_TYPE_HEALTHY"]
  }
}
