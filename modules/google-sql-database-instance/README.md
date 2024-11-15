<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_sql_database_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_networks"></a> [authorized\_networks](#input\_authorized\_networks) | A list of authorized network blocks as defined below.<br><br>  authorized\_network:<br>  - expiration\_time: (Optional) The RFC 3339 formatted date time string indicating when this whitelist expires.<br>  - name: (Optional) A name for this whitelist entry.<br>  - value: A CIDR notation IPv4 or IPv6 address that is allowed to access this instance. | <pre>list(<br>    object(<br>      {<br>        expiration_time = optional(string)<br>        name            = optional(string)<br>        value           = string<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | List of database flags to assign to the instance. | <pre>list(<br>    object(<br>      {<br>        name  = string<br>        value = string<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The MySQL, PostgreSQL or SQL Server version to use. The full list of supported versions can be found at https://cloud.google.com/sql/docs/db-versions. | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether Terraform will be prevented from destroying the instance. When the field is set to true or unset in Terraform state, a terraform apply or terraform destroy that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the instance. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project that the service account will be created in. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead. | `string` | `null` | no |
| <a name="input_root_password"></a> [root\_password](#input\_root\_password) | Initial root password. Can be updated. Required for MS SQL Server. | `string` | `null` | no |
| <a name="input_sql_server_audit_config"></a> [sql\_server\_audit\_config](#input\_sql\_server\_audit\_config) | A block describing a SQL Server audit configuration as described below.<br><br>  - bucket: (Optional) The name of the destination bucket (e.g., gs://mybucket).<br>  - upload\_interval: (Optional) How often to upload generated audit files. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".<br>  - retention\_interval: (Optional) How long to keep generated audit files. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | <pre>object({<br>    bucket             = optional(string)<br>    upload_interval    = optional(string)<br>    retention_interval = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | The machine type to use. See [tiers](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/tiers) for more details and supported versions | `string` | `"db-f1-micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Google SQL database instance |
<!-- END_TF_DOCS -->