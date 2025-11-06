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
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Unique identifier for the Cloud Storage Bucket in the form '{project-id}:{bucket-name}'. | `string` | n/a | yes |
| <a name="input_audit_data_type"></a> [audit\_data\_type](#input\_audit\_data\_type) | The type of audit data to pull from the bucket. Relevant for audit\_types PUBSUB and PUBSUB\_SLOW. Accepted values are: ALLOYDB\_POSTGRESQL, POSTGRESQL, BIGTABLE, BIGQUERY, MSSQL, MYSQL, MYSQL\_SLOW\_QUERY, SPANNER. | `string` | `null` | no |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Defines the type of audit used by DSF. In this case, where the audit files are stored. Accepted values are: PUBSUB, PUBSUB\_SLOW, BUCKET. Defaults to BUCKET. | `string` | `"BUCKET"` | no |
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | Content type should be set to the desired <'parent' asset "Server Type">, which is the one that uses this asset as a destination for logs. | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | GCP CLOUD STORAGE BUCKET asset. |
<!-- END_TF_DOCS -->