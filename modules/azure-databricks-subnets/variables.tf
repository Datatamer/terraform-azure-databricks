
variable "subnet_name_prefix" {
  type        = string
  description = "Prefix for the names of the resources created by this module"
  default     = "tamr-databricks"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of existing virtual network into which Databricks will be deployed"
}
variable "virtual_network_rg_name" {
  type        = string
  description = "Name of resource group which contiains the virtual network"
}
variable "private_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for private Databricks subnet"
}
variable "public_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for public Databricks subnet"
}
variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Databricks workspace"
  default     = {}
}
variable "service_delegation_actions" {
  default     = []
  type        = list(string)
  description = <<EOF
  A list of Actions which should be delegated.
  This list is specific to the service to delegate to.
  EOF
}
