terraform {
  required_version = "1.9.5"

  #     backend "remote" {
  #     organization = "packituz-Inc"
  #
  #     workspaces {
  #       name = "home-server-default"
  #     }
  #   }

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.7.0"
    }
  }
}

provider "grafana" {
  url  = var.host_url
  auth = "${var.admin_user}:${var.admin_password}"
}