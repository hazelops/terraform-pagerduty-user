variable "enabled" {
  type        = bool
  default     = true
  description = "Gives ability to enable or disable a module"
}

variable "name" {
  description = "The name of the user."
}

variable "email" {
  description = "The user's main email address."
}

variable "role" {
  description = "Account must have the 'read_only_users' ability to set a user as a 'read_only_user' or a 'read_only_limited_user', and must have advanced permissions abilities to set a user as observer or 'restricted_access'. Can be 'admin', 'limited_user', 'observer', 'owner', 'read_only_user', 'read_only_limited_user', 'restricted_access', or 'user'."
  default     = "user"
}

variable "job_title" {
  description = "The user's title."
  default     = "Engineer"
}

variable "mobile_country_code" {
  description = "The 1-to-3 digit country calling code. Required when using 'phone_contact_method' or 'sms_contact_method' (if you do not to specify '+', you would not)."
  default     = "+1"
}

variable "mobile" {
  description = "The 'mobile' to deliver to phone number."
}

//variable "device_type" {
//  desctiption = "Type of device 'android' or 'ios'."
//  default = "android"
//}

//variable "device_token" {
//  description = "Device token for push notification."
//  default = ""
//}

variable "start_delay_in_minutes_phone" {
  description = "The delay before firing the rule, in minutes."
  default     = 1
}

variable "start_delay_in_minutes_email" {
  description = "The delay before firing the rule, in minutes."
  default     = 1
}

variable "start_delay_in_minutes_sms" {
  description = "The delay before firing the rule, in minutes."
  default     = 10
}
