terraform {

  required_version = "~> 1.14.0"

  cloud {
    organization = "packituz-Inc"

    workspaces {
      name = "home-server-cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}