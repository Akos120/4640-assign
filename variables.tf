# API token
variable "do_token" {}

# Default region
variable "region" {
  type    = string
  default = "sfo3"
}

# Default droplet count
variable "droplet_count" {
  type    = number
  default = 1
}
