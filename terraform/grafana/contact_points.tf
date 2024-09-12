resource "grafana_contact_point" "telegram" {
  name = "Telegram Bot"

  telegram {
    chat_id = var.telegram_bot_chat_id
    token   = var.telegram_bot_token
  }
}