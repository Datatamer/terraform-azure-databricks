output "security_group_private_name" {
  value       = azurerm_network_security_group.databricks-subnet-private-sg.name
  description = "Name of security group assigned to the private subnet"
}

output "security_group_private_id" {
  value       = azurerm_network_security_group.databricks-subnet-private-sg.id
  description = "ID of security group assigned to the private subnet"
}

output "security_group_public_name" {
  value       = azurerm_network_security_group.databricks-subnet-public-sg.name
  description = "Name of security group assigned to the public subnet"
}

output "security_group_public_id" {
  value       = azurerm_network_security_group.databricks-subnet-public-sg.id
  description = "ID of security group assigned to the public subnet"
}
