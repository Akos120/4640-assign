# 4640-assign
These are a set of instructions on setting up basic resources and firewalls on DigitalOcean using Terraform

## Installing Terraform
1. Install using the binary from: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
  - for Linux install the AMD64 version
2. Unzip downloaded folder
3. Copy into your path
  - Put in your bin directory ```cp <binary folder> ~/bin```
4. Your .profile file should by default have a path to your bin directory
5. Source this file ```source .profile```

## DigitalOcean Setup
1. Create a project
2. Create a Personal Access Token(PAT) and save it (under API)
3. Create an SSH key (In DO located under Settings > Security
  - Can be created using ```ssh-keygen```
  - Put SSH key into .ssh

## Initial Setup
1. Create working directory
2. Create a .env file and add your PAT to it
```export TF_VAR_do_token=<your PAT>```
3. Expose the environment variable
```source .env```

## Resources Created
- VPC
- 3 Web Servers (droplets)
- Bastion Server
- Load Balancer
- MongoDB Database
- Firewall

