resource "grafana_apps_dashboard_dashboard_v2" "main" {
  metadata {
    uid = "main-dashboard"
  }
  spec {
    json = file("${path.module}/dashboards_files/grafana-main-dashboard.json")
  }

}

resource "grafana_apps_dashboard_dashboard_v2" "docker" {
  metadata {
    uid = "docker-detail"
  }
  spec {
    json = file("${path.module}/dashboards_files/grafana-docker-dashboard.json")
  }

}