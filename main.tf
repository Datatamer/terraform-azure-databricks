
resource "azurerm_databricks_workspace" "module-databricks" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"

  custom_parameters {
    no_public_ip        = false
    private_subnet_name = data.azurerm_subnet.private-subnet.name
    public_subnet_name  = data.azurerm_subnet.public-subnet.name
    virtual_network_id  = data.azurerm_virtual_network.parent.id
  }

  tags = var.tags
}

data "azurerm_virtual_network" "parent" {
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_rg_name
}

data "azurerm_subnet" "private-subnet" {
  name                 = var.private_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_rg_name
}

resource "azurerm_subnet_network_security_group_association" "private-subnet-sg-association" {
  subnet_id                 = data.azurerm_subnet.private-subnet.id
  network_security_group_id = azurerm_network_security_group.databricks-subnet-sg.id
}

data "azurerm_subnet" "public-subnet" {
  name                 = var.public_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_rg_name
}

resource "azurerm_subnet_network_security_group_association" "public-subnet-sg-association" {
  subnet_id                 = data.azurerm_subnet.public-subnet.id
  network_security_group_id = azurerm_network_security_group.databricks-subnet-sg.id
}

resource "azurerm_network_security_group" "databricks-subnet-sg" {
  name                = "${var.name}-subnet-security-group"
  location            = var.location
  resource_group_name = var.virtual_network_rg_name

  tags = var.tags
}
