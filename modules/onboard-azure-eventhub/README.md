# onboard-azure-eventhub
Creates and onboards an Azure Event Hub to DSF Hub using the default authentication mechanism (relying on access and secret keys), alongside creating the Storage Account used by DSF to store a marker when pulling data from the Event Hub.


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_azure-eventhub-asset"></a> [azure-eventhub-asset](#module\_azure-eventhub-asset)

Source: ../dsfhub-azure-eventhub

Version:

### <a name="module_eventhub"></a> [eventhub](#module\_eventhub)

Source: ../azurerm-eventhub

Version:

### <a name="module_eventhub-authorizations"></a> [eventhub-authorizations](#module\_eventhub-authorizations)

Source: ../azurerm-eventhub-namespace-authorization-rule

Version:

### <a name="module_eventhub-namespace"></a> [eventhub-namespace](#module\_eventhub-namespace)

Source: ../azurerm-eventhub-namespace

Version:

### <a name="module_storage-account"></a> [storage-account](#module\_storage-account)

Source: ../azurerm-storage-account

Version:

### <a name="module_storage-container"></a> [storage-container](#module\_storage-container)

Source: ../azurerm-storage-container

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_azure_eventhub_admin_email"></a> [azure\_eventhub\_admin\_email](#input\_azure\_eventhub\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_azure_eventhub_gateway_id"></a> [azure\_eventhub\_gateway\_id](#input\_azure\_eventhub\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name)

Description: Specifies the name of the Event Hub resource. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_eventhub_namespace_location"></a> [eventhub\_namespace\_location](#input\_eventhub\_namespace\_location)

Description: Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name)

Description: Specifies the name of the Event Hub Namespace resource. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_eventhub_namespace_resource_group_name"></a> [eventhub\_namespace\_resource\_group\_name](#input\_eventhub\_namespace\_resource\_group\_name)

Description: The name of the resource group in which to create the namespace. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_eventhub_resource_group_name"></a> [eventhub\_resource\_group\_name](#input\_eventhub\_resource\_group\_name)

Description: The name of the resource group in which the Event Hub's parent Namespace exists. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_storage_account_location"></a> [storage\_account\_location](#input\_storage\_account\_location)

Description: Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name)

Description: Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group.

Type: `string`

### <a name="input_storage_account_resource_group_name"></a> [storage\_account\_resource\_group\_name](#input\_storage\_account\_resource\_group\_name)

Description: The name of the resource group in which to create the storage account. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name)

Description: The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_azure_eventhub_format"></a> [azure\_eventhub\_format](#input\_azure\_eventhub\_format)

Description: The type of audit data being sent to the Event Hub. Possible values are: AzureSQL\_Managed, Blob, Cosmos\_Mongo, Cosmos\_SQL, Data\_Explorer, Databricks\_Workspace, File, Mariadb, Mysql, Postgresql, Postgresql\_Flexible, Queue, Sql, Synapse, Table. Defaults to Sql.

Type: `string`

Default: `"Sql"`

### <a name="input_azure_eventhub_parent_asset_id"></a> [azure\_eventhub\_parent\_asset\_id](#input\_azure\_eventhub\_parent\_asset\_id)

Description: The asset\_id of the azure asset that is sending its audit logs to this AZURE EVENTHUB asset.

Type: `string`

Default: `null`

### <a name="input_azure_eventhub_region"></a> [azure\_eventhub\_region](#input\_azure\_eventhub\_region)

Description: Azure region containing the Event Hub.

Type: `string`

Default: `null`

### <a name="input_eventhub_message_retention"></a> [eventhub\_message\_retention](#input\_eventhub\_message\_retention)

Description: Specifies the number of days to retain the events for this Event Hub. Maximum value is 7 days. Defaults to 1.

Type: `number`

Default: `1`

### <a name="input_eventhub_namespace_capacity"></a> [eventhub\_namespace\_capacity](#input\_eventhub\_namespace\_capacity)

Description: Specifies the Capacity / Throughput Units for a Standard SKU namespace. Defaults to 1.

Type: `number`

Default: `1`

### <a name="input_eventhub_namespace_public_network_access_enabled"></a> [eventhub\_namespace\_public\_network\_access\_enabled](#input\_eventhub\_namespace\_public\_network\_access\_enabled)

Description: Is public network access enabled for the Event Hub Namespace? Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_eventhub_namespace_sku"></a> [eventhub\_namespace\_sku](#input\_eventhub\_namespace\_sku)

Description: Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource. Defaults to Basic.

Type: `string`

Default: `"Basic"`

### <a name="input_eventhub_namespace_tags"></a> [eventhub\_namespace\_tags](#input\_eventhub\_namespace\_tags)

Description: A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_eventhub_partition_count"></a> [eventhub\_partition\_count](#input\_eventhub\_partition\_count)

Description: Specifies the current number of shards on the Event Hub. Note: partition\_count cannot be changed unless Eventhub Namespace SKU is Premium and cannot be decreased. Maximum value is 32. Defaults to 1.

Type: `number`

Default: `1`

### <a name="input_eventhub_status"></a> [eventhub\_status](#input\_eventhub\_status)

Description: Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled. Defaults to Active.

Type: `string`

Default: `"Active"`

### <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type)

Description: Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa. Defaults to GRS.

Type: `string`

Default: `"GRS"`

### <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier)

Description: Defines the Tier to use for this storage account. Valid options are Standard and Premium.

Type: `string`

Default: `"Standard"`

## Outputs

The following outputs are exported:

### <a name="output_azure-eventhub-asset"></a> [azure-eventhub-asset](#output\_azure-eventhub-asset)

Description: AZURE EVENTHUB asset.

### <a name="output_eventhub"></a> [eventhub](#output\_eventhub)

Description: Azure Event Hub.

### <a name="output_eventhub-namespace"></a> [eventhub-namespace](#output\_eventhub-namespace)

Description: Azure Event Hub Namespace.

### <a name="output_eventhub-read-authorization"></a> [eventhub-read-authorization](#output\_eventhub-read-authorization)

Description: Read authorization for the Event Hub Namespace.

### <a name="output_eventhub-write-authorization"></a> [eventhub-write-authorization](#output\_eventhub-write-authorization)

Description: Write authorization for the Event Hub Namespace.

### <a name="output_storage-account"></a> [storage-account](#output\_storage-account)

Description: Azure Storage Account.

### <a name="output_storage-container"></a> [storage-container](#output\_storage-container)

Description: Azure Storage Container.
<!-- END_TF_DOCS -->