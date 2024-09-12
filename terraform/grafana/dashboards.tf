resource "grafana_dashboard" "main" {
  config_json = file("${path.module}/dashboards_files/grafana-main-dashboard.json")
}

resource "grafana_dashboard" "docker" {
  config_json = file("${path.module}/dashboards_files/grafana-docker-dashboard.json")
}