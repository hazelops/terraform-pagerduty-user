output "user_id" {
  value = pagerduty_user.this[0].id
}

output "email_id" {
  value = jsondecode(data.http.this[0].body)["users"][0]["contact_methods"][0].id
}
