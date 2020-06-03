# Tamr Azure Databricks Module

This terraform module creates subnets for the Databricks workspace in Azure.

## Assumptions
* An Azure virtual network exists

# Examples

main.tf:
```
module "databricks_module" {
  source = "https://github.com/Datatamer/terraform-azure-databricks.git/modules/azure-databricks-subnets?ref=0.3.0"

  subnet_name_prefix = "databricks-example"
  resource_group_name = "demoGroup"
  virtual_network_name = "name"
  virtual_network_rg_name = "groupName"
  private_subnet_address_prefixes = ["1.2.3.0/26"]
  public_subnet_address_prefixes = ["1.2.3.64/26"]
}
```

## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-azure-databricks/tree/master/examples/minimal)

# Resources Created
This modules creates:
* 2 subnets

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
| private\_subnet\_address\_prefixes | Address space for private Databricks subnet | `list(string)` | n/a | yes |
| public\_subnet\_address\_prefixes | Address space for public Databricks subnet | `list(string)` | n/a | yes |
| virtual\_network\_name | Name of existing virtual network into which Databricks will be deployed | `string` | n/a | yes |
| virtual\_network\_rg\_name | Name of resource group which contiains the virtual network | `string` | n/a | yes |
| subnet\_name\_prefix | Prefix for the names of the resources created by this module | `string` | `"tamr-databricks"` | no |
| tags | Map of tags to attach to Databricks workspace | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_subnet\_id | ID of private subnet |
| private\_subnet\_name | Name of private subnet |
| private\_subnet\_prefix | Address space of private subnet |
| public\_subnet\_id | ID of public subnet |
| public\_subnet\_name | Name of public subnet |
| public\_subnet\_prefix | Address space of public subnet |

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
