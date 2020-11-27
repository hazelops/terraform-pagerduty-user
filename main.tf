resource "pagerduty_user" "this" {
  count     = var.enabled ? 1 : 0
  name      = var.name
  email     = var.email
  role      = var.role
  job_title = var.job_title
}

resource "pagerduty_user_contact_method" "this" {
  count        = var.enabled ? 1 : 0
  user_id      = pagerduty_user.this[0].id
  type         = "phone_contact_method"
  country_code = var.mobile_country_code
  address      = var.mobile
  label        = "Mobile"
}

resource "pagerduty_user_contact_method" "this" {
  count        = var.enabled ? 1 : 0
  user_id      = pagerduty_user.this[0].id
  type         = "sms_contact_method"
  country_code = var.mobile_country_code
  address      = var.mobile
  label        = "Mobile"
}