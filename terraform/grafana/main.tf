resource "grafana_organization" "main_org" {
  name         = var.main_organization_name
  admin_user   = var.admin_user
  create_users = true
}

resource "grafana_organization_preferences" "main_org_prefs" {
  theme              = "dark"
  home_dashboard_uid = grafana_dashboard.main.uid
}

resource "grafana_user" "admin" {
  name     = var.admin_user
  email    = var.admin_email
  password = var.admin_password
  is_admin = true
  login    = var.admin_user
}