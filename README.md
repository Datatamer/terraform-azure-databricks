# Tamr Azure Databricks Module

This terraform module creates a Databricks workspace in Azure.

## Assumptions
* An Azure virtual network exists that the Databricks workspace and associated subnets will be injected into.

# Examples
## Basic
`terraform apply`

main.tf:
```
module "databricks_module" {
  source = "https://github.com/Datatamer/terraform-azure-databricks.git?ref=0.2.0"

  name = "databricks-example"
  resource_group_name = "demoGroup"
  location = "eastus2"
  virtual_network_name = "name"
  virtual_network_rg_name = "groupName"
  private_subnet_address_prefix = "1.2.3.0/26"
  public_subnet_address_prefix = "1.2.3.64/26"
}
```

## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-azure-databricks/tree/master/examples/minimal)

# Resources Created
This modules creates:
* 1 Databricks workspace
* 2 subnets
* 1 security group

# Variables 
## Inputs
* `name`: Name of Databricks workspace
* `resource_group_name`: Name of resource group into which Databricks will be deployed
* `location`: Location in which Databricks will be deployed
* `virtual_network_name`: Name of EXISTING virtual network into which Databricks will be deployed
* `virtual_network_rg_name`: Name of resource group which contiains the virtual network
* `private_subnet_address_prefix`: Address space of the private subnet
* `public_subnet_address_prefix`: Address space of the public subnet
* `tags`: (Optional) Map of tags to attach to the Databricks workspace

## Outputs
* `workspace_name`: Name of Databricks workspace
* `private_subnet_name`: Name of private subnet
* `private_subnet_id`: ID of private subnet
* `private_subnet_prefix`: Address space of private subnet
* `public_subnet_name`: Name of public subnet
* `public_subnet_id`: ID of public subnet
* `public_subnet_prefix`: Address space of public subnet
* `security_group_name`: Name of security group assigned to subnets
* `security_group_id`: ID of security group assigned to subnets


# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

## Reference documents:
* Azure Databricks: https://docs.microsoft.com/en-us/azure/azure-databricks/
* Azure Databricks Terraform Docs: https://www.terraform.io/docs/providers/azurerm/r/databricks_workspace.html
* Azure Security Group Terraform Docs: https://www.terraform.io/docs/providers/azurerm/r/network_security_group.html
* Azure Subnet Terraform Docs: https://www.terraform.io/docs/providers/azurerm/r/subnet.html
 
# Development
## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
