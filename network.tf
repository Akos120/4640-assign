resource "digitalocean_vpc" "web_vpc" {
	name = "4640-assign"
	region = var.region
}
