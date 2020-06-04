output "workspace_name" {
  value       = azurerm_databricks_workspace.module-databricks.name
  description = "Name of Databricks workspace"
}
output "security_group_private_name" {
  value       = module.security-groups.security_group_private_name
  description = "Name of security group assigned to the private subnet"
}
output "security_group_private_id" {
  value       = module.security-groups.security_group_private_id
  description = "ID of security group assigned to the private subnet"
}
output "security_group_public_name" {
  value       = module.security-groups.security_group_public_name
  description = "Name of security group assigned to the public subnet"
}
output "security_group_public_id" {
  value       = module.security-groups.security_group_public_id
  description = "ID of security group assigned to the public subnet"
}
