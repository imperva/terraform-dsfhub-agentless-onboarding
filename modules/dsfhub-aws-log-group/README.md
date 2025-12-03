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
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | AWS log group ARN | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'. | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events). The parent must either be an AWS account, or have a parent which is an AWS account. | `string` | n/a | yes |
| <a name="input_reason"></a> [reason](#input\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region of the log group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS Log Group asset |
<!-- END_TF_DOCS -->