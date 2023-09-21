# VM Size: Acceptable values are B1s, B1ls
# OS Disk Type: Change the default disc type from "Premium SSD" to "Standard HDD"

# App Services
# Virtual Machines
# Azure SQL Databases
# Blob Storage
# Azure Active Directory
# Aspects of Azure Monitor, such as logs and alerts

# 
# Azure cli
# Steps to Create a Resource Group using the Azure CLI:
az login -u <username> -p <password>

# Log in using
az login

# We'll use the Azure CLI command 
az group create 
# and pass in two flags:
# resource group --name
# --location which is the same as the "region" field on the Azure portal.

# If you want to see a list of all locations, you can run 
az account list-locations -o table 
# to output the list in table format.

# I want to create my resource group in the West US 2 region: 
az group create --name resource-group-west --location westus2
# The resource group will be created and a JSON response will be returned with the status.

az config set core.allow_broker=true
az account clear
az login