terraform {

  required_version = "~> 1.12.0"

  cloud {
    organization = "packituz-Inc"

    workspaces {
      name = "home-server-grafana"
    }
  }

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.25.4"
    }
  }
}

provider "grafana" {
  url  = var.host_url
  auth = "${var.admin_email}:${var.admin_password}"
}