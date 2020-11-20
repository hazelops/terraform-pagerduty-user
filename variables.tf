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
  default = "user"
}

variable "job_title" {
  default = "N/A"
}

variable "team_membership" {}

variable "mobile_country_code" {}

variable "mobile" {}
