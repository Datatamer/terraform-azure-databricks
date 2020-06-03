output "workspace_name" {
  value       = azurerm_databricks_workspace.module-databricks.name
  description = "Name of Databricks workspace"
}
output "security_group_name" {
  value       = azurerm_network_security_group.databricks-subnet-sg.name
  description = "Name of security group assigned to subnets"
}
output "security_group_id" {
  value       = azurerm_network_security_group.databricks-subnet-sg.id
  description = "ID of security group assigned to subnets"
}
