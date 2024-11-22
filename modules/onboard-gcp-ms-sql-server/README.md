# onboard-gcp-ms-sql-server

Onboard Cloud SQL for SQL Server to DSF Hub.

## Notes
There are three prerequisites for using this module:
1. A Google Service Account with permissions to read from GCS buckets.
2. A Google Cloud Storage service (GCS) bucket in addition to a GCP CLOUD STORAGE BUCKET asset in DSF Hub.
3. A method to create an server audit policy on the SQL Server instance.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-ms-sql-server-asset"></a> [gcp-ms-sql-server-asset](#module\_gcp-ms-sql-server-asset) | ../dsfhub-gcp-ms-sql-server | n/a |
| <a name="module_gcp-ms-sql-server-instance"></a> [gcp-ms-sql-server-instance](#module\_gcp-ms-sql-server-instance) | ../google-sql-database-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_ms_sql_server_admin_email"></a> [gcp\_ms\_sql\_server\_admin\_email](#input\_gcp\_ms\_sql\_server\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_ms_sql_server_audit_pull_enabled"></a> [gcp\_ms\_sql\_server\_audit\_pull\_enabled](#input\_gcp\_ms\_sql\_server\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_gcp_ms_sql_server_gateway_id"></a> [gcp\_ms\_sql\_server\_gateway\_id](#input\_gcp\_ms\_sql\_server\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_ms_sql_server_logs_destination_asset_id"></a> [gcp\_ms\_sql\_server\_logs\_destination\_asset\_id](#input\_gcp\_ms\_sql\_server\_logs\_destination\_asset\_id) | The asset\_id of the GCP CLOUD STORAGE BUCKET asset that this asset is sending its audit logs to. | `string` | n/a | yes |
| <a name="input_gcp_ms_sql_server_parent_asset_id"></a> [gcp\_ms\_sql\_server\_parent\_asset\_id](#input\_gcp\_ms\_sql\_server\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |
| <a name="input_instance_authorized_networks"></a> [instance\_authorized\_networks](#input\_instance\_authorized\_networks) | A list of authorized network blocks as defined below.<br><br>  authorized\_network:<br>  - expiration\_time: (Optional) The RFC 3339 formatted date time string indicating when this whitelist expires.<br>  - name: (Optional) A name for this whitelist entry.<br>  - value: A CIDR notation IPv4 or IPv6 address that is allowed to access this instance. | <pre>list(<br>    object(<br>      {<br>        expiration_time = optional(string)<br>        name            = optional(string)<br>        value           = string<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_instance_database_flags"></a> [instance\_database\_flags](#input\_instance\_database\_flags) | List of database flags to assign to the instance. | <pre>list(<br>    object(<br>      {<br>        name  = string<br>        value = string<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_instance_database_version"></a> [instance\_database\_version](#input\_instance\_database\_version) | The SQL Server version to use. The full list of supported versions can be found at https://cloud.google.com/sql/docs/db-versions. | `string` | `"SQLSERVER_2019_STANDARD"` | no |
| <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection) | Whether Terraform will be prevented from destroying the instance. When the field is set to true or unset in Terraform state, a terraform apply or terraform destroy that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. | `bool` | `false` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the instance. | `string` | n/a | yes |
| <a name="input_instance_project"></a> [instance\_project](#input\_instance\_project) | The ID of the project that the service account will be created in. | `string` | `null` | no |
| <a name="input_instance_region"></a> [instance\_region](#input\_instance\_region) | The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead. | `string` | `null` | no |
| <a name="input_instance_root_password"></a> [instance\_root\_password](#input\_instance\_root\_password) | Initial root password. Can be updated. Required for MS SQL Server. | `string` | n/a | yes |
| <a name="input_instance_sql_server_audit_config"></a> [instance\_sql\_server\_audit\_config](#input\_instance\_sql\_server\_audit\_config) | A block describing a SQL Server audit configuration as described below.<br><br>  - bucket: (Optional) The name of the destination bucket (e.g., gs://mybucket).<br>  - upload\_interval: (Optional) How often to upload generated audit files. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".<br>  - retention\_interval: (Optional) How long to keep generated audit files. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | <pre>object({<br>    bucket             = optional(string)<br>    upload_interval    = optional(string)<br>    retention_interval = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_instance_tier"></a> [instance\_tier](#input\_instance\_tier) | The machine type to use. See [tiers](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/tiers) for more details and supported versions | `string` | `"db-f1-micro"` | no |
| <a name="input_storage_bucket_name"></a> [storage\_bucket\_name](#input\_storage\_bucket\_name) | Name of the GCS bucket that the SQL server instance will write its audit logs to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp-ms-sql-server-asset"></a> [gcp-ms-sql-server-asset](#output\_gcp-ms-sql-server-asset) | GCP MS SQL SERVER asset. |
| <a name="output_gcp-ms-sql-server-instance"></a> [gcp-ms-sql-server-instance](#output\_gcp-ms-sql-server-instance) | Google Cloud SQL for SQL Server instance. |
| <a name="output_service-account-permissions"></a> [service-account-permissions](#output\_service-account-permissions) | Permissions granted to the SQL Server service account. |
<!-- END_TF_DOCS -->