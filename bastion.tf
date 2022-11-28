# Create a bastion server
resource "digitalocean_droplet" "bastion" {
  image    = "rockylinux-9-x64"
  name     = "bastion-${var.region}"
  region   = var.region
  size     = "s-1vcpu-512mb-10gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]
  vpc_uuid = digitalocean_vpc.web_vpc.id
}

resource "digitalocean_firewall" "bastion" {
  name = "ssh-bastion-firewall"
  droplet_ids = [digitalocean_droplet.bastion.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = [digitalocean_vpc.web_vpc.ip_range]
  }
}

resource "digitalocean_project_resources" "project_attach" {
	project = data.digitalocean_project.assign_proj.id
	resources = [digitalocean_droplet.bastion.urn]
}
