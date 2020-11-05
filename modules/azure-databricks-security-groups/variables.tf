variable "security_group_name_prefix" {
  type        = string
  description = "Prefix for the names of the security groups created by this module"
  default     = "tamr-databricks"
}

variable "location" {
  type        = string
  description = "Location in which Databricks will be deployed"
}

variable "vnet_resource_group_name" {
  type        = string
  description = "Name of resource group which contains the virtual network and subnets"
}

variable "private_subnet_id" {
  type        = string
  description = "ID of the private subnet"
}

variable "public_subnet_id" {
  type        = string
  description = "ID of the public subnet"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Databricks workspace"
  default     = {}
}
