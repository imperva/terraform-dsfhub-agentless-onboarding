<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | >= 1.3.8 |

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
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Also referred to as the Client ID this is the unique identifier for the registered application being used to execute Python SDK commands against Azure’s API services. You can find this number under Azure Active Directory -> App Registrations -> Owned Applications. Required when using client\_secret auth mechanism. | `string` | `null` | no |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | The Azure resource ID of the eventhub. | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Possible values are: default, client\_secret, or azure\_ad. | `string` | `null` | no |
| <a name="input_azure_storage_account"></a> [azure\_storage\_account](#input\_azure\_storage\_account) | Name of the Azure Storage Account that will be used to store a marker for the Event Hub pulls. | `string` | `null` | no |
| <a name="input_azure_storage_container"></a> [azure\_storage\_container](#input\_azure\_storage\_container) | Name of the Azure Storage Container that will be used to store a marker for the Event Hub pulls. | `string` | `null` | no |
| <a name="input_azure_storage_secret_key"></a> [azure\_storage\_secret\_key](#input\_azure\_storage\_secret\_key) | Access Key with permissions to access the Storage Account. | `string` | `null` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | This a string containing a secret used by the application to prove its identity when requesting a token. You can get a secret by going to Azure Active Directory -> App Registrations -> Owned Applications, selecting the desired application and then going to Certificates & secrets -> Client secrets -> + New client secret. Required when using client\_secret auth mechanism. | `string` | `null` | no |
| <a name="input_directory_id"></a> [directory\_id](#input\_directory\_id) | Also referred to as the Tenant ID and is a GUID representing the Active Directory Tenant. It can be found in the Azure Active Directory page under the Azure portal. Required when using client\_secret auth mechanism. | `string` | `null` | no |
| <a name="input_eventhub_access_key"></a> [eventhub\_access\_key](#input\_eventhub\_access\_key) | The primary key of the shared shared access policy for the namespace containing the targeted Event Hub. | `string` | `null` | no |
| <a name="input_eventhub_access_policy"></a> [eventhub\_access\_policy](#input\_eventhub\_access\_policy) | The name of the shared access policy for the namespace containing the targeted Event Hub. | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | Name of the Event Hub containing the audit logs. | `string` | `null` | no |
| <a name="input_eventhub_namespace"></a> [eventhub\_namespace](#input\_eventhub\_namespace) | Name of the Event Hub Namespace containing the Event Hub. | `string` | `null` | no |
| <a name="input_format"></a> [format](#input\_format) | The type of audit data being sent to the Event Hub. Possible values are: AzureSQL\_Managed, Blob, Cosmos\_Mongo, Cosmos\_SQL, Cosmos\_Table, Data\_Explorer, Databricks\_Workspace, File, Mariadb, Mysql,  Mysql\_Flexible, Postgresql, Postgresql\_Flexible, Queue, Sql, Synapse, Table. Defaults to Sql. | `string` | `"Sql"` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id of the azure asset that is sending its audit logs to this AZURE EVENTHUB asset. | `string` | `null` | no |
| <a name="input_reason"></a> [reason](#input\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_region"></a> [region](#input\_region) | Azure region containing the Event Hub. | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Event Hub Namespace's service bus endpoint, e.g. mynamespace.servicebus.windows.net | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | This is the Azure account subscription ID. You can find this number under the Subscriptions page on the Azure portal. Required when using client\_secret auth mechanism. | `string` | `null` | no |
| <a name="input_user_identity_client_id"></a> [user\_identity\_client\_id](#input\_user\_identity\_client\_id) | The client ID of a user-assigned managed identity. Defaults to the value of the environment variable AZURE\_CLIENT\_ID, if any. If not specified, a system-assigned identity will be used. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AZURE EVENTHUB asset |
<!-- END_TF_DOCS -->