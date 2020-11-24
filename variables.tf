variable "pagerduty_token" {
  default = "YOUR_API_KEY_HERE"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Gives ability to enable or disable a module"
}

variable "name" {
  description = "Name of user. Make it meaningful"
}

variable "email" {}

variable "role" {
  description = "Account must have the read_only_users ability to set a user as a read_only_user or a read_only_limited_user, and must have advanced permissions abilities to set a user as observer or restricted_access. Can be admin, limited_user, observer, owner, read_only_user, read_only_limited_user, restricted_access, or user."
  default     = "user"
}

variable "job_title" {
  default = "N/A"
}

variable "mobile_country_code" {}

variable "mobile" {}
