variable "security-group-name-prefix" {
  type        = string
  description = "Prefix for the names of the security groups created by this module"
  default = "tamr-databricks"
}
variable "location" {
  type        = string
  description = "Location in which Databricks will be deployed"
}
variable "virtual_network_name" {
  type        = string
  description = "Name of existing virtual network into which Databricks will be deployed"
}
variable "virtual_network_rg_name" {
  type        = string
  description = "Name of resource group which contiains the virtual network and subnets"
}
variable "private_subnet_name" {
  type        = string
  description = "Name of the private subnet"
}
variable "public_subnet_name" {
  type        = string
  description = "Name of the public subnet"
}
variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Databricks workspace"
  default     = {}
}