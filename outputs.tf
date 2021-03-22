output "id" {
  value = join("", pagerduty_user.this[0].id)
}
