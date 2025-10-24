variable "admin_user" {
  type        = string
  description = "Grafana admin user name"
}

variable "admin_email" {
  type        = string
  description = "Grafana admin user email"
}

variable "admin_password" {
  type        = string
  description = "Grafana admin user password"
}

variable "main_organization_name" {
  type        = string
  description = "Main organization name"
  default     = "Main Org."
}

variable "host_url" {
  type        = string
  description = "Grafana Host URL"
}

variable "loki_data_source_url" {
  type        = string
  description = "Loki data source URL"
  default     = "http://loki:3100"
}

variable "loki_data_source_uid" {
  type        = string
  description = "Loki data source UID"
}

variable "prometheus_data_source_url" {
  type        = string
  description = "Prometheus data source URL"
  default     = "http://prometheus:9090"
}

variable "prometheus_data_source_uid" {
  type        = string
  description = "Prometheus data source UID"
}

variable "telegram_bot_token" {
  type        = string
  description = "Telegram bot token"
}

variable "telegram_bot_chat_id" {
  type        = string
  description = "Telegram bot chat ID"
}
