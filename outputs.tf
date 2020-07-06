output "workspace_name" {
  value       = module.databricks-workspace.workspace_name
  description = "Name of the Databricks workspace"
}
output "workspace_id" {
  value       = module.databricks-workspace.workspace_id
  description = "ID of the Databricks workspace"
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
