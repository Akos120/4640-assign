# Droplet IP
output "droplets_ip" {
	value = flatten([digitalocean_droplet.web.*.ipv4_address])
}

# Bastion IP
output "bastian_ip" {
	value = digitalocean_droplet.bastion.ipv4_address
}

# Loadbalancer IP
output "loadbalancer_ip" {
	value = digitalocean_loadbalancer.public.ip
}

# Database IP
output "database_ip" {
	value = digitalocean_database_cluster.mongodb-cluster.urn
}
