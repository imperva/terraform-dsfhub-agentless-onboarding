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

- [dsfhub_log_aggregator.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/log_aggregator) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name)

Description: User-friendly name of the asset, defined by user

Type: `string`

### <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id)

Description: AWS kinesis stream ARN

Type: `string`

### <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id)

Description: The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'.

Type: `string`

### <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id)

Description: The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events). The parent must either be an AWS account, or have a parent which is an AWS account.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details

Type: `string`

Default: `null`

### <a name="input_reason"></a> [reason](#input\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region of the kinesis stream

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS Kinesis asset
<!-- END_TF_DOCS -->