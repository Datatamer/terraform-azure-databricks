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
    virtual_network_id  = var.virtual_network_id
  }

  tags = var.tags
}
