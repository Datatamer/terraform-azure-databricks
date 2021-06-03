# Tamr Azure Databricks Module

This terraform module creates subnets for the Databricks workspace in Azure.

## Assumptions
* An Azure virtual network exists

# Examples

main.tf:
```
module "databricks_subnets_module" {
  source = "git::https://github.com/Datatamer/terraform-azure-databricks.git//modules/azure-databricks-subnets?ref=x.y.z"

  subnet_name_prefix = "databricks-example"
  resource_group_name = "demoGroup"
  vnet_id = "vnet-id"
  vnet_resource_group_name = "groupName"
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
| azurerm | >= 2.60.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.60.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| private\_subnet\_address\_prefixes | Address space for private Databricks subnet | `list(string)` | n/a | yes |
| public\_subnet\_address\_prefixes | Address space for public Databricks subnet | `list(string)` | n/a | yes |
| vnet\_name | Name of existing virtual network into which Databricks will be deployed | `string` | n/a | yes |
| vnet\_resource\_group\_name | Name of resource group which contains the virtual network | `string` | n/a | yes |
| additional\_service\_endpoints | List of additional Virtual Network service endpoints.<br>    NOTE: This module internally adds the `Microsoft.AzureActiveDirectory` and `Microsoft.Sql` endpoints to the created subnets | `list(string)` | <pre>[<br>  "Microsoft.Storage"<br>]</pre> | no |
| service\_delegation\_actions | A list of Actions which should be delegated.<br>  This list is specific to the service to delegate to. | `list(string)` | <pre>[<br>  "Microsoft.Network/virtualNetworks/subnets/join/action",<br>  "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",<br>  "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"<br>]</pre> | no |
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
