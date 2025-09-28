module "records" {
  source = "../modules/cloudflare/records"
  records = [
    {
      name = "cars"
    },
    {
      name = "comics"
    },
    {
      name = "docs"
    },
    {
      name = "grafana"
    },
    {
      name = "home"
    },
    {
      name = "jelly"
    },
    {
      name = "music"
    },
    {
      name = "notes"
    },
    {
      name = "ntfy"
    },
    {
      name = "papers"
    },
    {
      name = "photos"
    },
    {
      name = "ssh"
    },
    {
      name = "share"
    },
  ]
  zone_id = var.cloudflare_zone_id
  content = "${cloudflare_zero_trust_tunnel_cloudflared.packituz_dev_tunnel.id}.cfargotunnel.com"
}

resource "cloudflare_zero_trust_access_policy" "papers_policy" {
  account_id = var.cloudflare_account_id
  decision   = "allow"
  name       = "Policy for accessing papers"
  include = [
    {
      email = {
        email = var.admin_dg_email
      }
    },
    {
      email = {
        email = var.cloudflare_notification_email
      }
    }
  ]
}

resource "cloudflare_zero_trust_access_application" "papers_app" {
  zone_id          = var.cloudflare_zone_id
  name             = "Access application for papers"
  domain           = "papers.packituz.dev"
  session_duration = "60m"
  type             = "self_hosted"

  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.papers_policy.id
      precedence = 1
    }
  ]

}


resource "cloudflare_zero_trust_access_policy" "cars_policy" {
  decision = "allow"
  name     = "Policy for accessing cars"
  include = [
    {
      email = {
        email = var.admin_dg_email
      }
    },
    {
      email = {
        email = var.cloudflare_notification_email
      }
    }
  ]
  account_id = var.cloudflare_account_id
}

resource "cloudflare_zero_trust_access_application" "cars_app" {
  zone_id          = var.cloudflare_zone_id
  type             = "self_hosted"
  name             = "Access application for cars"
  domain           = "cars.packituz.dev"
  session_duration = "60m"
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.cars_policy.id
      precedence = 1
    }
  ]

}

resource "cloudflare_zero_trust_access_policy" "photos_policy" {
  decision = "allow"
  name     = "Policy for accessing photos"
  include = [
    {
      email = {
        email = var.admin_dg_email
      }
    },
    {
      email = {
        email = var.cloudflare_notification_email
      }
    }
  ]
  account_id = var.cloudflare_account_id
}

resource "cloudflare_zero_trust_access_application" "photos_app" {
  zone_id          = var.cloudflare_zone_id
  type             = "self_hosted"
  name             = "Access application for photos"
  domain           = "photos.packituz.dev"
  session_duration = "60m"
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.photos_policy.id
      precedence = 1
    }
  ]

}


resource "cloudflare_zero_trust_access_policy" "docs_policy" {
  decision = "allow"
  name     = "Policy for accessing docs"
  include = [
    {
      email = {
        email = var.admin_dg_email
      }
    },
    {
      email = {
        email = var.cloudflare_notification_email
      }
    }
  ]
  account_id = var.cloudflare_account_id
}

resource "cloudflare_zero_trust_access_application" "docs_app" {
  zone_id          = var.cloudflare_zone_id
  type             = "self_hosted"
  name             = "Access application for docs"
  domain           = "docs.packituz.dev"
  session_duration = "60m"
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.docs_policy.id
      precedence = 1
    }
  ]

}