<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_log_aggregator.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/log_aggregator) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | The Azure resource ID of the eventhub. | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection | `string` | `null` | no |
| <a name="input_azure_storage_account"></a> [azure\_storage\_account](#input\_azure\_storage\_account) | Name of the Azure Storage Account that will be used to store a marker for the Event Hub pulls. | `string` | `null` | no |
| <a name="input_azure_storage_container"></a> [azure\_storage\_container](#input\_azure\_storage\_container) | Name of the Azure Storage Container that will be used to store a marker for the Event Hub pulls. | `string` | `null` | no |
| <a name="input_azure_storage_secret_key"></a> [azure\_storage\_secret\_key](#input\_azure\_storage\_secret\_key) | Access Key with permissions to access the Storage Account. | `string` | `null` | no |
| <a name="input_eventhub_access_key"></a> [eventhub\_access\_key](#input\_eventhub\_access\_key) | The primary key of the shared shared access policy for the namespace containing the targeted Event Hub. | `string` | `null` | no |
| <a name="input_eventhub_access_policy"></a> [eventhub\_access\_policy](#input\_eventhub\_access\_policy) | The name of the shared access policy for the namespace containing the targeted Event Hub. | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | Name of the Event Hub containing the audit logs. | `string` | `null` | no |
| <a name="input_eventhub_namespace"></a> [eventhub\_namespace](#input\_eventhub\_namespace) | Name of the Event Hub Namespace containing the Event Hub. | `string` | `null` | no |
| <a name="input_format"></a> [format](#input\_format) | The type of audit data being sent to the Event Hub. Possible values are: AzureSQL\_Managed, Blob, Cosmos\_Mongo, Cosmos\_SQL, Data\_Explorer, Databricks\_Workspace, File, Mariadb, Mysql, Postgresql, Postgresql\_Flexible, Queue, Sql, Synapse, Table. Defaults to Sql. | `string` | `"Sql"` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id of the azure asset that is sending its audit logs to this AZURE EVENTHUB asset. | `string` | `null` | no |
| <a name="input_reason"></a> [reason](#input\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_region"></a> [region](#input\_region) | Azure region containing the Event Hub. | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Event Hub Namespace's service bus endpoint, e.g. mynamespace.servicebus.windows.net | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AZURE EVENTHUB asset |
<!-- END_TF_DOCS -->