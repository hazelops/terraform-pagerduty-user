data "http" "this" {
  count = var.enabled ? 1 : 0
  url   = "https://api.pagerduty.com/users?total=false"

  request_headers = {
    accept        = "application/vnd.pagerduty+json;version=2"
    authorization = "Token token=${var.pagerduty_token}"
    content-type  = "application/json"
  }
}