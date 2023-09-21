# Azure Storage Options
# Among others, some of the Azure Storage options are:

# Azure SQL Server and SQL Database
# Azure Blob Storage
# Azure CosmosDB
# Disk Storage
# Azure Data Lake Storage
# HPC Cache


# Solution: Azure SQL Databases using Azure CLI.
# Create SQL Server
az sql server create \
--admin-user udacityadmin \
--admin-password p@ssword1234 \
--name hello-world-server \
--resource-group resource-group-west \
--location westus2 \
--enable-public-network true \
--verbose

# Create Firewall rule
az sql server firewall-rule create \
-g resource-group-west \
-s hello-world-server \
-n azureaccess \
--start-ip-address 0.0.0.0 \
--end-ip-address 0.0.0.0 \
--verbose

# Create clientIp firewall rule
az sql server firewall-rule create \
-g resource-group-west \
-s hello-world-server \
-n clientip \
--start-ip-address <PUBLIC-IP-ADDRESS> \
--end-ip-address <PUBLIC_IP_ADDRESS> \
--verbose

# Create SQL Database
az sql db create \
--name hello-world-db \
--resource-group resource-group-west \
--server hello-world-server \
--service-objective S0 \
--verbose


# Cleanup
# You can find the CLI commands for cleaning up the SQL resources below.

# Delete DB
az sql db delete \
--name hello-world-db \
--resource-group resource-group-west \
--server hello-world-server \
--verbose

# Delete SQL Server
az sql server delete \
--name hello-world-server \
--resource-group resource-group-west \
--verbose

# ................ Azure Blob Storage ....................
# First, we create our storage account. We use the following command:

az storage account create \
 --name helloworld12345 \
 --resource-group resource-group-west \
 --location westus2

# Then we create our container.
az storage container create \
 --account-name helloworld12345 \
 --name images \
 --auth-mode login \
 --public-access container 

# 
# SQL Server
.database.windows.net

# App Service
.azurewebsites.net

# Storage Account 
.blob.core.windows.net