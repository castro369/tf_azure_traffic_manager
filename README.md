# Azure Traffic Manager Multi-Region

This code deploys two app services to **two different regions** and one traffic manager to **load balance** the apps **globally**. 

## Usage
1. Choose a way of safely authenticating to your Azure Environment.
`Suggestion: Managed Identities, Service Principles`
2. Create a file (e.g. `terraform.provider.credentials.tf`) and fill in the required provider configurations.
```
# Auhentication Setup
provider "azurerm" {
  subscription_id = {CHANGE_ME}
  client_id = {CHANGE_ME}
  client_secret = {CHANGE_ME}
  tenant_id = {CHANGE_ME}
  features {}
}
```
3. (Optional) The code has default values set to allow the user to deploy it straight away, however if desired, the values used can be adjusted by using a `terraform.tfvars` file and changing the values of the variables used.
4. Initialize terraform in the directory
```terraform init```
5. Apply the Terraform Configurations
```terraform apply```

## Notes
The SKU of the Application Service Plan needs to be a **Standard Tier**, by default the **P1v2** SKU is choosen, otherwise if a lower tier is used the Traffic Manager will show a 404 Error Status.

## Versions
The `.terraform.lock.hcl` file has been added to the repository so the tested working versions are used when running terraform.
```
Terraform v1.6.0
azurerm v3.75.0
random v3.5.1
```