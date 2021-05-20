resource "azurerm_subnet" "private-subnet" {
  name                 = "${var.subnet_name_prefix}-private-subnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = var.vnet_name

  address_prefixes = var.private_subnet_address_prefixes

  service_endpoints = concat(
    [
      "Microsoft.AzureActiveDirectory",
      "Microsoft.Sql",
    ],
  var.additional_service_endpoints)

  delegation {
    name = "${var.subnet_name_prefix}-private-subnet-delegation"

    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = var.service_delegation_actions
    }
  }
}

resource "azurerm_subnet" "public-subnet" {
  name                 = "${var.subnet_name_prefix}-public-subnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = var.vnet_name

  address_prefixes = var.public_subnet_address_prefixes

  service_endpoints = concat([
    "Microsoft.AzureActiveDirectory",
    "Microsoft.Sql",
  ], var.additional_service_endpoints)

  delegation {
    name = "${var.subnet_name_prefix}-public-subnet-delegation"

    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = var.service_delegation_actions
    }
  }
}
