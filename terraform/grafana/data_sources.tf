resource "grafana_data_source" "prometheus" {
  name = "Prometheus"
  type = "prometheus"
  url  = var.prometheus_data_source_url

  json_data_encoded = jsonencode({
    httpMethod = "POST"
  })

  uid = var.prometheus_data_source_uid

}

resource "grafana_data_source" "loki" {
  name = "Loki"
  type = "loki"
  url  = var.loki_data_source_url

  uid = var.loki_data_source_uid
}