resource "pagerduty_user" "this" {
  count     = var.enabled ? 1 : 0
  name      = var.name
  email     = var.email
  role      = var.role
  job_title = var.job_title
}

resource "pagerduty_user_contact_method" "phone" {
  count        = (var.enabled && length(var.mobile) > 0) ? 1 : 0
  user_id      = pagerduty_user.this[0].id
  type         = "phone_contact_method"
  country_code = var.mobile_country_code
  address      = var.mobile
  label        = "Mobile Call"
}

resource "pagerduty_user_contact_method" "sms" {
  count        = (var.enabled && length(var.mobile) > 0) ? 1 : 0
  user_id      = pagerduty_user.this[0].id
  type         = "sms_contact_method"
  country_code = var.mobile_country_code
  address      = var.mobile
  label        = "Mobile SMS"
}

// TODO: https://github.com/PagerDuty/terraform-provider-pagerduty/issues/268
// I will leave it here for better times
//
//resource "pagerduty_user_contact_method" "push" {
//  count        = var.enabled ? 1 : 0
//  user_id      = pagerduty_user.this[0].id
//  type         = "push_notification_contact_method"
//  device_type  = var.device_type
//  address      = var.device_token
//  label        = "Push notification"
//}

resource "pagerduty_user_notification_rule" "low_urgency_email" {
  count                  = var.enabled ? 1 : 0
  user_id                = pagerduty_user.this[0].id
  start_delay_in_minutes = var.start_delay_in_minutes_email
  urgency                = "low"

  contact_method = {
    type = "email_contact_method"
    id   = jsondecode(data.http.pagerduty_users[0].body)["users"][0]["contact_methods"][0].id
  }
}

resource "pagerduty_user_notification_rule" "high_urgency_phone" {
  count                  = (var.enabled && length(var.mobile) > 0) ? 1 : 0
  user_id                = pagerduty_user.this[0].id
  start_delay_in_minutes = var.start_delay_in_minutes_phone
  urgency                = "high"

  contact_method = {
    type = "phone_contact_method"
    id   = pagerduty_user_contact_method.phone[0].id
  }
}

resource "pagerduty_user_notification_rule" "low_urgency_sms" {
  count                  = (var.enabled && length(var.mobile) > 0) ? 1 : 0
  user_id                = pagerduty_user.this[0].id
  start_delay_in_minutes = var.start_delay_in_minutes_sms
  urgency                = "low"

  contact_method = {
    type = "sms_contact_method"
    id   = pagerduty_user_contact_method.sms[0].id
  }
}
