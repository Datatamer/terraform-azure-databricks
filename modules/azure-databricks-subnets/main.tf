
data "azurerm_virtual_network" "parent" {
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_rg_name
}

resource "azurerm_subnet" "private-subnet" {
  name                 = "${var.subnet_name_prefix}-private-subnet"
  resource_group_name  = var.virtual_network_rg_name
  virtual_network_name = var.virtual_network_name

  address_prefixes = var.private_subnet_address_prefixes

  service_endpoints = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.Sql",
  ]

  delegation {
    name = "${var.subnet_name_prefix}-private-subnet-delegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

resource "azurerm_subnet" "public-subnet" {
  name                 = "${var.subnet_name_prefix}-public-subnet"
  resource_group_name  = var.virtual_network_rg_name
  virtual_network_name = var.virtual_network_name

  address_prefixes = var.public_subnet_address_prefixes

  service_endpoints = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.Sql",
  ]

  delegation {
    name = "${var.subnet_name_prefix}-public-subnet-delegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}
