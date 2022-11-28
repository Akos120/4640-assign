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

## Files Created
- main.tf = provider info
- variables.tf = variables (i.e. region, API token, droplet count)
- terraform.tfvars = variable values
- output.tf = any output blocks (i.e. ip addresses)
- database.tf = database creation and firewall
- servers.tf = your droplets(web servers), load balancer and firewall
- bastion.tf = bastion server and firewall
- network.tf = vpc
- data.tf = any data block (i.e. ssh key, project name)

## Terraform
1. After creating main.tf run ```terraform init```
   this will setup your working directory with the files needed to work with your provider
2. After creating all your files you can run the following commands
    - ```terraform validate``` to check your syntax and structure
    - ```terraform fmt``` to format your main.tf file
    - ```terraform plan``` to show an overview of what you are making without actually creating the resources
    - ```terraform apply``` to finally create your resources
3. After you run ```terraform apply``` you should see the outputs you set in the output.tf file
![output!](/images/output.png "output")

## Bastion Server
1. SSH into Bastion server
    - In your host run ```ssh-add <path to your key>```
    - Can then connect to the Bastion server with ```ssh -A root@<Bastion IP>```
    ![Connect Bastion!](/images/ssh_connect.png "Connect Bastion")
2. From the Bastion server you can connect to your other droplets ```ssh root@<web_ip>```
![Connect Internal!](/images/ssh_connect2.png "Connect Internal")

## Database
1. Create the database first without the firewall (so you can check connection)
2. In DO under Manage > Databases you should be able to see your mongo cluster and details on it   
![Cluster information!](/images/database_connection2.png "Details of Database")
4. Using CLI connect to the database  
![Successful Connection!](/images/database_connection.png "Connection Success")

4. After confirming connection, add the firewall and run ```terraform apply``` again to update it
5. With the firewall up you will no longer be able to connect to the database  
![Cluster info!](/images/database_connection3.png "Details of Database")
![No Success!](/images/database_connection4.png "No Connect")
