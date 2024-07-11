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
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the assets. | `string` | `"test@example.com"` | no |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | The display name of the asset. | `string` | `"AWS DocumentDB Cluster"` | no |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | The unique identifier of the asset, typically its arn. | `string` | n/a | yes |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Identifier of AWS DocumentDB Cluster. | `string` | n/a | yes |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | DSFHUB Cloud Account Asset ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region of the AWS DocumentDB Cluster. | `string` | n/a | yes |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | The endpoint of the AWS DocumentDB Cluster. | `string` | n/a | yes |
| <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip) | The IP address of the AWS DocumentDB Cluster. | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | The port on which the DB accepts connections. | `number` | `27017` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS DocumentDB Cluster asset |
<!-- END_TF_DOCS -->