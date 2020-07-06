output "workspace_name" {
  value       = azurerm_databricks_workspace.module-databricks.name
  description = "Name of the Databricks workspace"
}

output "workspace_id" {
  value       = azurerm_databricks_workspace.module-databricks.id
  description = "ID of the Databricks workspace"
}
