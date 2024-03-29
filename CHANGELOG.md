# Tamr Azure Databricks module

# v1.0.0 - June 1st 2021
* Upgrade `azurerm` provider

# v0.6.0 - May 19th 2021
* Add `additional_service_endpoints` variable to `azure-databricks-subnets` submodule

# v0.5.1 - December 1st 2020
* Updates an outdated reference to `name` in the root module

# v0.5.0 - November 4th 2020
* Renames `name` to `workspace_name` for clarity
* Renames `security-group-name-prefix` to `security_group_name_prefix` for naming consistency
* Renames `virtual_network_id` to `vnet_id`
* Renames `virtual_network_rg_name` to `vnet_resource_group_name`
* Renames `virtual_network_name` to `vnet_name`

# v0.4.2 - September 8th 2020
* Remove data blocks that attach to subnets during runtime
* Add required variables `private_subnet_id` and `public_subnet_id`

# v0.4.1 - August 4th 2020
* Adds a new variable to set delegation actions in the subnets module
* Minor documentation cleanup

# v0.4.0 - June 4th 2020
* Moves the creation of security groups into its own module
* Creates 2 separate security groups for the private/public subnets
* Moves the creation of the databricks workspace into its own module
* Documentation cleanup

# v0.3.0 - June 3rd 2020
* Moves the creation of subnets into its own module

# v0.2.1 - June 1st 2020
* Documentation of variables updated to be autogenerated
* Reformatting of terraform files to be compliant with the linting

# v0.2.0 - May 28th 2020
* Updates the module to be compliant with Azure provider 2.11.0
* Adds a minimal example

# v0.1.0 - May 12th 2020
* Tamr Azure Databricks module added
