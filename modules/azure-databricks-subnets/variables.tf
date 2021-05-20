variable "subnet_name_prefix" {
  type        = string
  description = "Prefix for the names of the resources created by this module"
  default     = "tamr-databricks"
}

variable "vnet_name" {
  type        = string
  description = "Name of existing virtual network into which Databricks will be deployed"
}

variable "vnet_resource_group_name" {
  type        = string
  description = "Name of resource group which contains the virtual network"
}

variable "private_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for private Databricks subnet"
}

variable "public_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for public Databricks subnet"
}

variable "service_delegation_actions" {
  default = [
    "Microsoft.Network/virtualNetworks/subnets/join/action",
    "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
    "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
  ]
  type        = list(string)
  description = <<EOF
  A list of Actions which should be delegated.
  This list is specific to the service to delegate to.
  EOF
}

variable "additional_service_endpoints" {
  type        = list(string)
  description = <<EOT
    List of additional Virtual Network service endpoints.
    NOTE: This module internally adds the `Microsoft.AzureActiveDirectory` and `Microsoft.Sql` endpoints to the created subnets
  EOT
  default     = ["Microsoft.Storage"]
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Databricks workspace"
  default     = {}
}
