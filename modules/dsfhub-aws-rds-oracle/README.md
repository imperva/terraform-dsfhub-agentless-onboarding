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
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | AWS ARN, e.g. "arn:aws:rds:us-east-2:123456790:db:db-name" | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `null` | no |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection | `string` | `null` | no |
| <a name="input_dsn"></a> [dsn](#input\_dsn) | Datasource name to use in odbc.ini. If using the asset for SDM, keep a dummy DSN value. | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events) | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | Password to use to connect to Oracle database. Must not include semicolons. | `string` | `null` | no |
| <a name="input_reason"></a> [reason](#input\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region containing the instance. | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Endpoint URL, e.g. <domain>.amazon.com | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Endpoint URL, e.g. <domain>.amazon.com | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Oracle service name, or SID. e.g. ORCL | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Username to use to connect to Oracle database. | `string` | `null` | no |
| <a name="input_wallet_dir"></a> [wallet\_dir](#input\_wallet\_dir) | Path to the Oracle wallet directory | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS RDS Oracle asset |
<!-- END_TF_DOCS -->