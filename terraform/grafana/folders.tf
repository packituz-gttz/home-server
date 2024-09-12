resource "grafana_folder" "docker_alerts_folder" {
  title  = "Docker Alerts"
  org_id = grafana_organization.main_org.id
}

resource "grafana_folder" "system_alerts_folder" {
  title  = "System Alerts"
  org_id = grafana_organization.main_org.id
}