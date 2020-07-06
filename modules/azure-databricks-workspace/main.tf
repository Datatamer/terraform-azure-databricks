// Retrieve the data references to the existing subnets
data "azurerm_virtual_network" "parent" {
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_rg_name
}

// Create the databricks workspace
resource "azurerm_databricks_workspace" "module-databricks" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"

  custom_parameters {
    no_public_ip        = false
    private_subnet_name = var.private_subnet_name
    public_subnet_name  = var.public_subnet_name
    virtual_network_id  = data.azurerm_virtual_network.parent.id
  }

  tags = var.tags
}
