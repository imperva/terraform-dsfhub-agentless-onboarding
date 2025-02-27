# onboard-gcp-postgresql

Onboard Cloud SQL for PostgreSQL to DSF Hub.

## Notes
There are four prerequisites for using this module:
1. A Google Service Account with permissions to read from PubSub subscriptions.
2. Data Access logs to be enabled for the Cloud SQL API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions.
3. A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF Hub.
4. A method to create the 'pgaudit' extension on the postgres instance.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-postgresql-asset"></a> [gcp-postgresql-asset](#module\_gcp-postgresql-asset) | ../dsfhub-gcp-postgresql | n/a |
| <a name="module_gcp-postgresql-instance"></a> [gcp-postgresql-instance](#module\_gcp-postgresql-instance) | ../google-sql-database-instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_postgresql_admin_email"></a> [gcp\_postgresql\_admin\_email](#input\_gcp\_postgresql\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_postgresql_audit_pull_enabled"></a> [gcp\_postgresql\_audit\_pull\_enabled](#input\_gcp\_postgresql\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_gcp_postgresql_gateway_id"></a> [gcp\_postgresql\_gateway\_id](#input\_gcp\_postgresql\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_postgresql_logs_destination_asset_id"></a> [gcp\_postgresql\_logs\_destination\_asset\_id](#input\_gcp\_postgresql\_logs\_destination\_asset\_id) | The asset\_id of the GCP PUSUB asset that this asset is sending its audit logs to. | `string` | `null` | no |
| <a name="input_gcp_postgresql_parent_asset_id"></a> [gcp\_postgresql\_parent\_asset\_id](#input\_gcp\_postgresql\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |
| <a name="input_instance_authorized_networks"></a> [instance\_authorized\_networks](#input\_instance\_authorized\_networks) | A list of authorized network blocks as defined below.<br><br>  authorized\_network:<br>  - expiration\_time: (Optional) The RFC 3339 formatted date time string indicating when this whitelist expires.<br>  - name: (Optional) A name for this whitelist entry.<br>  - value: A CIDR notation IPv4 or IPv6 address that is allowed to access this instance. | <pre>list(<br>    object(<br>      {<br>        expiration_time = optional(string)<br>        name            = optional(string)<br>        value           = string<br>      }<br>    )<br>  )</pre> | n/a | yes |
| <a name="input_instance_database_flags"></a> [instance\_database\_flags](#input\_instance\_database\_flags) | List of database flags to assign to the instance. | <pre>list(<br>    object(<br>      {<br>        name  = string<br>        value = string<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "name": "cloudsql.enable_pgaudit",<br>    "value": "on"<br>  },<br>  {<br>    "name": "log_error_verbosity",<br>    "value": "verbose"<br>  },<br>  {<br>    "name": "log_connections",<br>    "value": "on"<br>  },<br>  {<br>    "name": "log_disconnections",<br>    "value": "on"<br>  },<br>  {<br>    "name": "log_hostname",<br>    "value": "on"<br>  },<br>  {<br>    "name": "pgaudit.log",<br>    "value": "all"<br>  },<br>  {<br>    "name": "log_line_prefix",<br>    "value": "SONAR_AUDIT=1|TIMESTAMP=%m|APPLICATION_NAME=%a|USER=%u|DATABASE=%d|REMOTE_HOST_AND_PORT=%r|SQL_STATE=%e|SESSION_ID=%c|SESSION_START=%s|PROCESS_ID=[%p]|VIRTUAL_TRANSACTION_ID=%v|TRANSACTION_ID=%x| "<br>  }<br>]</pre> | no |
| <a name="input_instance_database_version"></a> [instance\_database\_version](#input\_instance\_database\_version) | The PostgreSQL version to use. The full list of supported versions can be found at https://cloud.google.com/sql/docs/db-versions. | `string` | `"POSTGRES_16"` | no |
| <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection) | Whether Terraform will be prevented from destroying the instance. When the field is set to true or unset in Terraform state, a terraform apply or terraform destroy that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. | `bool` | `false` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the instance. | `string` | n/a | yes |
| <a name="input_instance_project"></a> [instance\_project](#input\_instance\_project) | The ID of the project that the service account will be created in. | `string` | `null` | no |
| <a name="input_instance_region"></a> [instance\_region](#input\_instance\_region) | The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead. | `string` | `null` | no |
| <a name="input_instance_tier"></a> [instance\_tier](#input\_instance\_tier) | The machine type to use. See [tiers](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/tiers) for more details and supported versions | `string` | `"db-perf-optimized-N-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp-postgresql-asset"></a> [gcp-postgresql-asset](#output\_gcp-postgresql-asset) | GCP POSTGRESQL asset |
| <a name="output_gcp-postgresql-instance"></a> [gcp-postgresql-instance](#output\_gcp-postgresql-instance) | Google PostgreSQL database instance |
<!-- END_TF_DOCS -->