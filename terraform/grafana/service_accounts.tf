resource "grafana_service_account" "viewer_service_account" {
  name = "ai-agent"
  role = "Viewer"
  is_disabled = false
}

resource "grafana_service_account_token" "ai_agent_token" {
  name               = "ai_agent_token"
  service_account_id = grafana_service_account.viewer_service_account.id
  seconds_to_live = 0
}