  // Retrieve the data references to the existing subnets
data "azurerm_subnet" "private-subnet" {
  name                 = var.private_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_rg_name
}

data "azurerm_subnet" "public-subnet" {
  name                 = var.public_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_rg_name
}

// Create the security groups and make the associations with the subnets
resource "azurerm_network_security_group" "databricks-subnet-private-sg" {
  name                = "${var.security-group-name-prefix}-private-subnet-security-group"
  location            = var.location
  resource_group_name = var.virtual_network_rg_name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "private-subnet-sg-association" {
  subnet_id                 = data.azurerm_subnet.private-subnet.id
  network_security_group_id = azurerm_network_security_group.databricks-subnet-private-sg.id
}

resource "azurerm_network_security_group" "databricks-subnet-public-sg" {
  name                = "${var.security-group-name-prefix}-public-subnet-security-group"
  location            = var.location
  resource_group_name = var.virtual_network_rg_name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "public-subnet-sg-association" {
  subnet_id                 = data.azurerm_subnet.public-subnet.id
  network_security_group_id = azurerm_network_security_group.databricks-subnet-public-sg.id
}
