resource "azurerm_databricks_workspace" "module-databricks" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"

  custom_parameters {
    no_public_ip = false
    private_subnet_name = azurerm_subnet.private-subnet.name
    public_subnet_name = azurerm_subnet.public-subnet.name
    virtual_network_id = data.azurerm_virtual_network.parent.id
  }

  tags = var.tags
}

data "azurerm_virtual_network" "parent" {
  name = var.virtual_network_name
  resource_group_name = var.virtual_network_rg_name
}

resource "azurerm_subnet" "private-subnet" {
  name = "${var.name}-private-subnet"
  resource_group_name = var.virtual_network_rg_name
  virtual_network_name = var.virtual_network_name

  address_prefix = var.private_subnet_address_prefix

  network_security_group_id = azurerm_network_security_group.databricks-subnet-sg.id

  service_endpoints = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.Sql",
  ]

  delegation {
    name = "${var.name}-private-subnet-delegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

resource "azurerm_subnet" "public-subnet" {
  name = "${var.name}-public-subnet"
  resource_group_name = var.virtual_network_rg_name
  virtual_network_name = var.virtual_network_name

  address_prefix = var.public_subnet_address_prefix

  network_security_group_id = azurerm_network_security_group.databricks-subnet-sg.id

  service_endpoints = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.Sql",
  ]

  delegation {
    name = "${var.name}-public-subnet-delegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

resource "azurerm_network_security_group" "databricks-subnet-sg" {
  name = "${var.name}-subnet-security-group"
  location = var.location
  resource_group_name = var.virtual_network_rg_name

  tags = var.tags
}
