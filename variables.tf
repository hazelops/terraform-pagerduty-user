variable "pagerduty_token" {}

variable "enabled" {
  type        = bool
  default     = true
  description = "Gives ability to enable or disable a module"
}

variable "name" {
  description = "The name of the user."
}

variable "email" {
  description = "The user's email address."
}

variable "role" {
  description = "Account must have the 'read_only_users' ability to set a user as a 'read_only_user' or a 'read_only_limited_user', and must have advanced permissions abilities to set a user as observer or 'restricted_access'. Can be 'admin', 'limited_user', 'observer', 'owner', 'read_only_user', 'read_only_limited_user', 'restricted_access', or 'user'."
  default     = "user"
}

variable "job_title" {
  description = "The user's title."
  default = "N/A"
}

variable "mobile_country_code" {
  description = " The 1-to-3 digit country calling code. Required when using 'phone_contact_method' or 'sms_contact_method'."
}

variable "mobile" {
  description = "The 'mobile' to deliver to phone number."
}
