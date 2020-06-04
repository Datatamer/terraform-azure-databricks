
output "databricks-module" {
  value       = module.databricks
  description = "All the resources created by the databricks module"
}

output "subnet-module" {
  value       = module.subnets
  description = "All the resources created by the databricks module"
}

output "databricks-vnet-id" {
  value       = azurerm_virtual_network.databricks-vnet.id
  description = "The virtual network created for databricks"
}

output "databricks-resource-group-id" {
  value       = azurerm_resource_group.databricks-rg.id
  description = "The resource group created for databricks"
}
