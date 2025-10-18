terraform {

  required_version = "~> 1.13.0"

  cloud {
    organization = "packituz-Inc"

    workspaces {
      name = "home-server-grafana"
    }
  }

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "4.11.1"
    }
  }
}

provider "grafana" {
  url  = var.host_url
  auth = "${var.admin_email}:${var.admin_password}"
}