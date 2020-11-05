// Create the security groups and make the associations with the subnets
resource "azurerm_network_security_group" "databricks-subnet-private-sg" {
  name                = "${var.security_group_name_prefix}-private-subnet-security-group"
  location            = var.location
  resource_group_name = var.vnet_resource_group_name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "private-subnet-sg-association" {
  subnet_id                 = var.private_subnet_id
  network_security_group_id = azurerm_network_security_group.databricks-subnet-private-sg.id
}

resource "azurerm_network_security_group" "databricks-subnet-public-sg" {
  name                = "${var.security_group_name_prefix}-public-subnet-security-group"
  location            = var.location
  resource_group_name = var.vnet_resource_group_name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "public-subnet-sg-association" {
  subnet_id                 = var.public_subnet_id
  network_security_group_id = azurerm_network_security_group.databricks-subnet-public-sg.id
}
