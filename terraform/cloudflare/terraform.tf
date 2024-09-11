terraform {

  required_version = "1.9.5"

  backend "remote" {
    organization = "packituz-Inc"

    workspaces {
      name = "home-server-default"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}