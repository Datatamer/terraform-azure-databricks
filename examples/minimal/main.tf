resource "azurerm_resource_group" "databricks-rg" {
  name     = "tamrDatabricksResourceGroup"
  location = "East US"
}

# New networks for this deployment
resource "azurerm_virtual_network" "databricks-vnet" {
  name = "tamrDatabricksVirtualNetwork"

  location            = azurerm_resource_group.databricks-rg.location
  resource_group_name = azurerm_resource_group.databricks-rg.name

  address_space = ["1.2.3.0/25"]
}


module "databricks" {
  //source = "git@github.com:Datatamer/terraform-azure-databricks.git"
  source              = "../../"
  workspace_name      = "tamr-databricks"
  resource_group_name = azurerm_resource_group.databricks-rg.name
  location            = azurerm_resource_group.databricks-rg.location

  vnet_id                  = azurerm_virtual_network.databricks-vnet.id
  vnet_resource_group_name = azurerm_resource_group.databricks-rg.name

  private_subnet_name = module.subnets.private_subnet_name
  private_subnet_id   = module.subnets.private_subnet_id
  public_subnet_name  = module.subnets.public_subnet_name
  public_subnet_id    = module.subnets.public_subnet_id
}

module "subnets" {
  //source = "https://github.com/Datatamer/terraform-azure-databricks.git/modules/azure-databricks-subnets"
  source             = "../../modules/azure-databricks-subnets/"
  subnet_name_prefix = "tamr-databricks-example"

  vnet_name                = azurerm_virtual_network.databricks-vnet.name
  vnet_resource_group_name = azurerm_resource_group.databricks-rg.name

  private_subnet_address_prefixes = ["1.2.3.0/26"]
  public_subnet_address_prefixes  = ["1.2.3.64/26"]
}
