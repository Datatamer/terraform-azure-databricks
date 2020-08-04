# Tamr Azure Databricks Module

This terraform module creates a security groups for databricks subnets

## Assumptions
* An Azure virtual network exists and subnets already exist

# Examples
## Basic
`terraform apply`

main.tf:
```
module "databricks_sg_module" {
  source = "https://github.com/Datatamer/terraform-azure-databricks.git/modules/azure-databricks-security-groups?ref=0.4.0"

  name = "databricks-example"
  resource_group_name = "rg"
  location = "eastus2"
  virtual_network_name = "vnet"
  virtual_network_rg_name = "rg"
  private_subnet_name = "databricks-private-subnet"
  public_subnet_name = "databricks-public-subnet"
}
```

## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-azure-databricks/tree/master/examples/minimal)

# Resources Created
This modules creates:
* 2 security group

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
| private\_subnet\_name | Name of the private subnet | `string` | n/a | yes |
| public\_subnet\_name | Name of the public subnet | `string` | n/a | yes |
| virtual\_network\_name | Name of existing virtual network into which Databricks will be deployed | `string` | n/a | yes |
| virtual\_network\_rg\_name | Name of resource group which contiains the virtual network and subnets | `string` | n/a | yes |
| security-group-name-prefix | Prefix for the names of the security groups created by this module | `string` | `"tamr-databricks"` | no |
| tags | Map of tags to attach to Databricks workspace | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_private\_id | ID of security group assigned to the private subnet |
| security\_group\_private\_name | Name of security group assigned to the private subnet |
| security\_group\_public\_id | ID of security group assigned to the public subnet |
| security\_group\_public\_name | Name of security group assigned to the public subnet |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
