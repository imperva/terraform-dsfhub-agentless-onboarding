<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [dsfhub_data_source.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/data_source) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id)

Description: The unique identifier of the asset, typically its arn.

Type: `string`

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: Identifier of AWS DocumentDB Cluster.

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: DSFHUB Cloud Account Asset ID

Type: `string`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region of the AWS DocumentDB Cluster.

Type: `string`

### <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name)

Description: The endpoint of the AWS DocumentDB Cluster.

Type: `string`

### <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip)

Description: The IP address of the AWS DocumentDB Cluster.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email)

Description: The email address to notify about the assets.

Type: `string`

Default: `"test@example.com"`

### <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name)

Description: The display name of the asset.

Type: `string`

Default: `"AWS DocumentDB Cluster"`

### <a name="input_server_port"></a> [server\_port](#input\_server\_port)

Description: The port on which the DB accepts connections.

Type: `number`

Default: `27017`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS DocumentDB Cluster asset
<!-- END_TF_DOCS -->