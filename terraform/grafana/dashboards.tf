resource "grafana_apps_dashboard_dashboard_v2" "main" {
  spec {
    json = file("${path.module}/dashboards_files/grafana-main-dashboard.json")
  }

}

resource "grafana_dashboard" "docker" {
  config_json = file("${path.module}/dashboards_files/grafana-docker-dashboard.json")
}