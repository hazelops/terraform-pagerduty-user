output "id" {
  value = var.enabled ? pagerduty_user.this[0].id : ""
}
