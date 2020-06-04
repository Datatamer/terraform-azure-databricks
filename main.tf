// Retrieve the data references to the existing subnets
data "azurerm_virtual_network" "parent" {
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_rg_name
}

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

// Create the databricks workspace
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

// Create the databricks security groups
module "security-groups" {
  source                     = "./modules/azure-databricks-security-groups"
  security-group-name-prefix = var.name
  location                   = var.location
  virtual_network_name       = data.azurerm_virtual_network.parent.name
  virtual_network_rg_name    = var.virtual_network_rg_name
  private_subnet_name        = data.azurerm_subnet.private-subnet.name
  public_subnet_name         = data.azurerm_subnet.public-subnet.name
  tags                       = var.tags
}
