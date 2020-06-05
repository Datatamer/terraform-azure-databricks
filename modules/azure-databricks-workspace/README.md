# Tamr Azure Databricks Module

This terraform module creates a Databricks workspace in Azure.

## Assumptions
* An Azure virtual, subnets, and security groups exist

# Examples
## Basic
`terraform apply`

main.tf:
```
module "databricks_module" {
  source = "https://github.com/Datatamer/terraform-azure-databricks.git?ref=0.4.0"

  name = "tamr-databricks"
  resource_group_name = "rg"
  location = "eastus2"
  virtual_network_name = "vnet"
  virtual_network_rg_name = "rg"
  private_subnet_name = "databricks-private-subnet"
  public_subnet_name = "databricks-public-subnet"
}
```

## Minimal
Smallest complete working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-azure-databricks/tree/master/examples/minimal)

# Resources Created
This modules creates:
* 1 Databricks workspace

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | Location in which Databricks will be deployed | `string` | n/a | yes |
| name | Name of Databricks workspace | `string` | n/a | yes |
| private\_subnet\_name | Name of the private subnet | `string` | n/a | yes |
| public\_subnet\_name | Name of the public subnet | `string` | n/a | yes |
| resource\_group\_name | Name of resource group into which Databricks will be deployed | `string` | n/a | yes |
| virtual\_network\_name | Name of existing virtual network into which Databricks will be deployed | `string` | n/a | yes |
| virtual\_network\_rg\_name | Name of resource group which contiains the virtual network and subnets | `string` | n/a | yes |
| tags | Map of tags to attach to Databricks workspace | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_private\_id | ID of security group assigned to the private subnet |
| security\_group\_private\_name | Name of security group assigned to the private subnet |
| security\_group\_public\_id | ID of security group assigned to the public subnet |
| security\_group\_public\_name | Name of security group assigned to the public subnet |
| workspace\_name | Name of Databricks workspace |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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