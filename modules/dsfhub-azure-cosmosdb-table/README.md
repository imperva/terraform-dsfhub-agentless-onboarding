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
| [dsfhub_data_source.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | The Azure resource ID of the Azure CosmosDB Table account. | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_logs_destination_asset_id"></a> [logs\_destination\_asset\_id](#input\_logs\_destination\_asset\_id) | The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to. | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Azure CosmosDB Table account endpoint. | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Azure CosmosDB Table account port. Defaults to 443. | `string` | `"443"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AZURE COSMOSDB TABLE asset. |
<!-- END_TF_DOCS -->