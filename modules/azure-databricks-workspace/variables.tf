variable "workspace_name" {
  type        = string
  description = "Name of Databricks workspace"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group into which Databricks will be deployed"
}

variable "location" {
  type        = string
  description = "Location in which Databricks will be deployed"
}

variable "vnet_id" {
  type        = string
  description = "ID of existing virtual network into which Databricks will be deployed"
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
