<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | >= 1.3.5 |

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
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Unique identifier of the Google PubSub Subscription in the form 'projects/{{project}}/subscriptions/{{name}}'. | `string` | n/a | yes |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Identifier for the type of audit data contained within the PubSub Subscription. Supported values: ALLOYDB\_POSTGRESQL, BIGQUERY, BIGTABLE, GCP\_MYSQL\_SLOW, MYSQL, MSSQL, POSTGRESQL, SPANNER. | `string` | `null` | no |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Supported values: default, service\_account. | `string` | `"default"` | no |
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | Desired 'parent' asset 'Server Type' which is the one tha tuses this asset as a destination for logs. NOTE: The content\_type field will take precedence on the lookup for parent\_asset\_id field when checking which server is sending logs to this asset. | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_key_file"></a> [key\_file](#input\_key\_file) | Path to JSON file with credentials info (service account's key) residing on your Agentless Gateway. File must be accessible by the sonarw OS user. Required when auth\_mechanism is set to 'service\_account'. | `string` | `null` | no |
| <a name="input_pubsub_subscription"></a> [pubsub\_subscription](#input\_pubsub\_subscription) | ID of the Google PubSub Subscription in the form 'projects/{{project}}/subscriptions/{{name}}'. | `string` | n/a | yes |
| <a name="input_reason"></a> [reason](#input\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | GCP PUBSUB asset. |
<!-- END_TF_DOCS -->