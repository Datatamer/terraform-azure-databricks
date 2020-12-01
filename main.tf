// Create the databricks workspace
module "databricks-workspace" {
  source              = "./modules/azure-databricks-workspace"
  workspace_name      = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_id             = var.vnet_id
  private_subnet_name = var.private_subnet_name
  public_subnet_name  = var.public_subnet_name
  tags                = var.tags
}

// Create the security groups for the subnets
module "security-groups" {
  source                     = "./modules/azure-databricks-security-groups"
  security_group_name_prefix = var.workspace_name
  location                   = var.location
  vnet_resource_group_name   = var.vnet_resource_group_name
  private_subnet_id          = var.private_subnet_id
  public_subnet_id           = var.public_subnet_id
  tags                       = var.tags
}
