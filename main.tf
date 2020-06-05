// Create the databricks workspace
module "databricks-workspace" {
  source                     = "./modules/azure-databricks-workspace"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_name  = var.virtual_network_name
  virtual_network_rg_name = var.virtual_network_rg_name
  private_subnet_name = var.private_subnet_name
  public_subnet_name = var.public_subnet_name
  tags = var.tags
}

// Create the security groups for the subnets
module "security-groups" {
  source                     = "./modules/azure-databricks-security-groups"
  security-group-name-prefix = var.name
  location                   = var.location
  virtual_network_name       = var.virtual_network_name
  virtual_network_rg_name    = var.virtual_network_rg_name
  private_subnet_name        = var.private_subnet_name
  public_subnet_name         = var.public_subnet_name
  tags                       = var.tags
}
