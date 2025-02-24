# onboard-gcp-mysql

Onboard Cloud SQL for MySQL to DSF Hub.

## Notes
There are three prerequisites for using this module:
1. A Google Service Account with permissions to read from PubSub subscriptions.
2. Data Access logs to be enabled for the Cloud SQL API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions.
3. A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF Hub.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-mysql-asset"></a> [gcp-mysql-asset](#module\_gcp-mysql-asset) | ../dsfhub-gcp-mysql | n/a |
| <a name="module_gcp-mysql-instance"></a> [gcp-mysql-instance](#module\_gcp-mysql-instance) | ../google-sql-database-instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_mysql_admin_email"></a> [gcp\_mysql\_admin\_email](#input\_gcp\_mysql\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_mysql_audit_pull_enabled"></a> [gcp\_mysql\_audit\_pull\_enabled](#input\_gcp\_mysql\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_gcp_mysql_gateway_id"></a> [gcp\_mysql\_gateway\_id](#input\_gcp\_mysql\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_mysql_logs_destination_asset_id"></a> [gcp\_mysql\_logs\_destination\_asset\_id](#input\_gcp\_mysql\_logs\_destination\_asset\_id) | The asset\_id of the GCP PUSUB asset that this asset is sending its audit logs to. | `string` | n/a | yes |
| <a name="input_gcp_mysql_parent_asset_id"></a> [gcp\_mysql\_parent\_asset\_id](#input\_gcp\_mysql\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |
| <a name="input_instance_authorized_networks"></a> [instance\_authorized\_networks](#input\_instance\_authorized\_networks) | A list of authorized network blocks as defined below.<br><br>  authorized\_network:<br>  - expiration\_time: (Optional) The RFC 3339 formatted date time string indicating when this whitelist expires.<br>  - name: (Optional) A name for this whitelist entry.<br>  - value: A CIDR notation IPv4 or IPv6 address that is allowed to access this instance. | <pre>list(<br>    object(<br>      {<br>        expiration_time = optional(string)<br>        name            = optional(string)<br>        value           = string<br>      }<br>    )<br>  )</pre> | n/a | yes |
| <a name="input_instance_database_flags"></a> [instance\_database\_flags](#input\_instance\_database\_flags) | List of database flags to assign to the instance. | <pre>list(<br>    object(<br>      {<br>        name  = string<br>        value = string<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "name": "log_output",<br>    "value": "FILE"<br>  },<br>  {<br>    "name": "general_log",<br>    "value": "on"<br>  }<br>]</pre> | no |
| <a name="input_instance_database_version"></a> [instance\_database\_version](#input\_instance\_database\_version) | The MySQL version to use. The full list of supported versions can be found at https://cloud.google.com/sql/docs/db-versions. | `string` | `"MYSQL_8_0"` | no |
| <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection) | Whether Terraform will be prevented from destroying the instance. When the field is set to true or unset in Terraform state, a terraform apply or terraform destroy that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. | `bool` | `false` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the instance. | `string` | n/a | yes |
| <a name="input_instance_project"></a> [instance\_project](#input\_instance\_project) | The ID of the project that the service account will be created in. | `string` | `null` | no |
| <a name="input_instance_region"></a> [instance\_region](#input\_instance\_region) | The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead. | `string` | `null` | no |
| <a name="input_instance_tier"></a> [instance\_tier](#input\_instance\_tier) | The machine type to use. See [tiers](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/tiers) for more details and supported versions | `string` | `"db-f1-micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp-mysql-asset"></a> [gcp-mysql-asset](#output\_gcp-mysql-asset) | GCP MYSQL asset |
| <a name="output_gcp-mysql-instance"></a> [gcp-mysql-instance](#output\_gcp-mysql-instance) | Google MySQL database instance |
<!-- END_TF_DOCS -->
