resource "pagerduty_user" "this" {
  count     = var.enabled ? 1 : 0
  name      = var.name
  email     = var.email_main
  role      = var.role
  job_title = var.job_title
}

resource "pagerduty_user_contact_method" "email" {
  count   = var.enabled ? 1 : 0
  user_id = pagerduty_user.this[0].id
  type    = "email_contact_method"
  address = var.email_contact
  label   = "Email"
}

resource "pagerduty_user_contact_method" "phone" {
  count        = var.enabled ? 1 : 0
  user_id      = pagerduty_user.this[0].id
  type         = "phone_contact_method"
  country_code = var.mobile_country_code
  address      = var.mobile
  label        = "Mobile Call"
}

resource "pagerduty_user_contact_method" "sms" {
  count        = var.enabled ? 1 : 0
  user_id      = pagerduty_user.this[0].id
  type         = "sms_contact_method"
  country_code = var.mobile_country_code
  address      = var.mobile
  label        = "Mobile SMS"
}

resource "pagerduty_user_notification_rule" "high_urgency_phone" {
  count                  = var.enabled ? 1 : 0
  user_id                = pagerduty_user.this[0].id
  start_delay_in_minutes = 1
  urgency                = "high"

  contact_method = {
    type = "phone_contact_method"
    id   = pagerduty_user_contact_method.phone[0].id
  }
}

resource "pagerduty_user_notification_rule" "low_urgency_email" {
  count                  = var.enabled ? 1 : 0
  user_id                = pagerduty_user.this[0].id
  start_delay_in_minutes = 1
  urgency                = "low"

  contact_method = {
    type = "email_contact_method"
    id   = pagerduty_user_contact_method.email[0].id
  }
}

resource "pagerduty_user_notification_rule" "low_urgency_sms" {
  count                  = var.enabled ? 1 : 0
  user_id                = pagerduty_user.this[0].id
  start_delay_in_minutes = 10
  urgency                = "low"

  contact_method = {
    type = "sms_contact_method"
    id   = pagerduty_user_contact_method.sms[0].id
  }
}
