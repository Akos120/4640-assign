data "digitalocean_ssh_key" "ssh_key" {
	name = "4640_ssh"
}

data "digitalocean_project" "assign_proj" {
	name = "4640-Assignment"
}
