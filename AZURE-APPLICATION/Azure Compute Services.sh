# Virtual Machines
# App Services
# Azure Batch
# Azure Functions
# Container Instances
# Service Fabric
# Azure Kubernetes Service (AKS)

# We'll need the admin username we set when creating the VM - "udacityadmin"
scp -r /create-vm-starter vietnv17@40.76.142.224:/home/vietnv17

# 
# Virtual Machines
# We'll need the public IP address of our VM. You can use the following command to grab the IPs addresses for a particular VM from the CLI—
az vm list-ip-addresses -g <RESOURCE-GROUP> -n <VIRTUAL-MACHINE-NAME>
az vm list-ip-addresses -g resource-group-west -n VM-test-Uda

ssh [ADMIN-NAME]@[PUBLIC-IP]
# ssh vietnv17@40.76.142.224
# Vietnv17123456789
sudo apt-get -y update && sudo apt-get -y install nginx python3-venv
cd /etc/nginx/sites-available
# We’ll first unlink the default site using
sudo unlink /etc/nginx/sites-enabled/default
# Then we’ll create a new file reverse-proxy.conf in the /etc/nginx/sites-available
sudo vim reverse-proxy.conf
server {
        listen 80;
        location / {
                proxy_pass http://localhost:3000;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection keep-alive;
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }
}

sudo service nginx restart

# Deploying the App to the VM
cd to web
# Create venv
python3 -m venv venv
# Activate the env 
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
# We'll run our app 
python application.py

# Fix issue
pip install --upgrade Flask Jinja2
pip uninstall Flask Jinja2
pip install Flask Jinja2
pip show Flask
pip show Jinja2

# .......................... Solution: Creating a Virtual Machine ........................... #
az login
# Next, we'll create our VM using az vm create. 
# If we don't pass a location, it defaults to the location of the resource group. 
# This would be fine in most cases, but it's worth noting that sometimes a VM size might not be available in the same region as your resource group, 
# so you'd have to pass in a location for a different region.
az vm create \
   --resource-group "resource-group-west" \
   --name "linux-vm-west" \
   --location "westus2" \
   --image "UbuntuLTS" \
   --size "Standard_B1ls" \
   --admin-username "udacityadmin" \
   --generate-ssh-keys \
   --verbose

# open port 80 to allow outside traffic to our VM
az vm open-port \
    --port "80" \
    --resource-group "resource-group-west" \
    --name "linux-vm-west"   

# ................ Connecting to the VM ......................
# We'll need the admin username we set when creating the VM
# We'll need the public IP address of our VM. You can use the following command to grab the IP address for a particular VM from the CLI.
az vm list-ip-addresses -g resource-group-west -n linux-vm-west    
# copy a basic Flask app from my local machine to the VM =>  secure copy utility.
https://www.hypexr.org/linux_scp_help.php
# Now we can connect to the VM with 
“ssh [username]@[IP Address]”
ssh udacityadmin@20.109.169.130
#  Note: Since we generated SSH keys, you won't be prompted for a password.
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa

scp -r /create-vm-starter udacityadmin@20.109.169.130:/home/udacityadmin
  

# Cleanup
# If we no longer need a resource, we can delete them through the portal. 
# The quickest way to do this from the CLI is to delete the resource group. 
# This will delete all resources in that group
az group delete -n resource-group-west