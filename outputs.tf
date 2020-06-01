output "workspace_name" {
  value       = azurerm_databricks_workspace.module-databricks.name
  description = "Name of Databricks workspace"
}
output "private_subnet_name" {
  value       = azurerm_subnet.private-subnet.name
  description = "Name of private subnet"
}
output "private_subnet_id" {
  value       = azurerm_subnet.private-subnet.id
  description = "ID of private subnet"
}
output "private_subnet_prefix" {
  value       = azurerm_subnet.private-subnet.address_prefix
  description = "Address space of private subnet"
}
output "public_subnet_name" {
  value       = azurerm_subnet.public-subnet.name
  description = "Name of public subnet"
}
output "public_subnet_id" {
  value       = azurerm_subnet.public-subnet.id
  description = "ID of public subnet"
}
output "public_subnet_prefix" {
  value       = azurerm_subnet.public-subnet.address_prefix
  description = "Address space of public subnet"
}
output "security_group_name" {
  value       = azurerm_network_security_group.databricks-subnet-sg.name
  description = "Name of security group assigned to subnets"
}
output "security_group_id" {
  value       = azurerm_network_security_group.databricks-subnet-sg.id
  description = "ID of security group assigned to subnets"
}
