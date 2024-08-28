# onboard-aws-neptune
Onboard Amazon Neptune to DSF Hub.

## Notes
There is one prerequisite for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from CloudWatch log groups.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset) | ../dsfhub-aws-log-group | n/a |
| <a name="module_aws-neptune-cluster-asset"></a> [aws-neptune-cluster-asset](#module\_aws-neptune-cluster-asset) | ../dsfhub-aws-neptune-cluster | n/a |
| <a name="module_neptune-cluster"></a> [neptune-cluster](#module\_neptune-cluster) | ../aws-neptune-cluster | n/a |
| <a name="module_neptune-cluster-parameter-group"></a> [neptune-cluster-parameter-group](#module\_neptune-cluster-parameter-group) | ../aws-neptune-cluster-parameter-group | n/a |
| <a name="module_neptune-instance"></a> [neptune-instance](#module\_neptune-instance) | ../aws-neptune-instance | n/a |
| <a name="module_neptune-log-group"></a> [neptune-log-group](#module\_neptune-log-group) | ../aws-cloudwatch-log-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_aws_neptune_cluster_admin_email"></a> [aws\_neptune\_cluster\_admin\_email](#input\_aws\_neptune\_cluster\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_neptune_cluster_gateway_id"></a> [aws\_neptune\_cluster\_gateway\_id](#input\_aws\_neptune\_cluster\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_neptune_cluster_parent_asset_id"></a> [aws\_neptune\_cluster\_parent\_asset\_id](#input\_aws\_neptune\_cluster\_parent\_asset\_id) | The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default | `string` | n/a | yes |
| <a name="input_aws_neptune_cluster_region"></a> [aws\_neptune\_cluster\_region](#input\_aws\_neptune\_cluster\_region) | AWS region containing the instance. | `string` | n/a | yes |
| <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_cluster_backup_retention_period"></a> [cluster\_backup\_retention\_period](#input\_cluster\_backup\_retention\_period) | The days to retain backups for. Default is 1 | `number` | `1` | no |
| <a name="input_cluster_enable_cloudwatch_logs_exports"></a> [cluster\_enable\_cloudwatch\_logs\_exports](#input\_cluster\_enable\_cloudwatch\_logs\_exports) | A list of the log types this DB cluster is configured to export to Cloudwatch Logs. Currently only supports audit and slowquery | `list(string)` | <pre>[<br>  "audit"<br>]</pre> | no |
| <a name="input_cluster_engine"></a> [cluster\_engine](#input\_cluster\_engine) | The name of the database engine to be used for this Neptune cluster. | `string` | `"neptune"` | no |
| <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version) | The database engine version. | `string` | `"1.3.2.0"` | no |
| <a name="input_cluster_iam_database_authentication_enabled"></a> [cluster\_iam\_database\_authentication\_enabled](#input\_cluster\_iam\_database\_authentication\_enabled) | Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled. | `bool` | `true` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The cluster identifier | `string` | n/a | yes |
| <a name="input_cluster_preferred_maintenance_window"></a> [cluster\_preferred\_maintenance\_window](#input\_cluster\_preferred\_maintenance\_window) | Weekly time range during which system maintenance can occur, in (UTC). | `string` | `"sun:18:00-sun:21:00"` | no |
| <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot) | Determines whether a final Neptune snapshot is created before the Neptune cluster is deleted. If true is specified, no Neptune snapshot is created. If false is specified, a Neptune snapshot is created before the Neptune cluster is deleted, using the value from final\_snapshot\_identifier | `bool` | `true` | no |
| <a name="input_cluster_storage_type"></a> [cluster\_storage\_type](#input\_cluster\_storage\_type) | Storage type associated with the cluster. Default: standard | `string` | `"standard"` | no |
| <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids) | List of VPC security groups to associate with the Cluster | `list(string)` | `null` | no |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Specifies whether any instance modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_instance_auto_minor_version_upgrade"></a> [instance\_auto\_minor\_version\_upgrade](#input\_instance\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the instance during the maintenance window. Default is false. | `bool` | `false` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance class to use. | `string` | `"db.t3.medium"` | no |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | The identifier for the neptune instance. | `string` | n/a | yes |
| <a name="input_instance_neptune_parameter_group_name"></a> [instance\_neptune\_parameter\_group\_name](#input\_instance\_neptune\_parameter\_group\_name) | The name of the neptune parameter group to associate with this instance | `string` | `"default.neptune1"` | no |
| <a name="input_instance_neptune_subnet_group_name"></a> [instance\_neptune\_subnet\_group\_name](#input\_instance\_neptune\_subnet\_group\_name) | A subnet group to associate with this neptune instance. NOTE: This must match the neptune\_subnet\_group\_name of the attached aws\_neptune\_cluster | `string` | `null` | no |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | The port on which the DB accepts connections. Defaults to 8182 | `number` | `8182` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | Bool to control if instance is publicly accessible. Default is false. | `bool` | `false` | no |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire. | `number` | `7` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | Neptune cluster parameter group | `string` | `"Neptune cluster parameter group"` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | The family of the cluster parameter group. | `string` | `"neptune1.3"` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the cluster parameter group. | `string` | n/a | yes |
| <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters) | List of objects containing parameters for the cluster parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate")<br>      value        = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "neptune_enable_audit_log",<br>    "value": 1<br>  }<br>]</pre> | no |
| <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | Neptune Cluster |
| <a name="output_cluster_parameter_group"></a> [cluster\_parameter\_group](#output\_cluster\_parameter\_group) | Neptune Cluster parameter group |
| <a name="output_dsf_neptune_cluster"></a> [dsf\_neptune\_cluster](#output\_dsf\_neptune\_cluster) | Neptune cluster DSF asset |
| <a name="output_dsf_neptune_log_group"></a> [dsf\_neptune\_log\_group](#output\_dsf\_neptune\_log\_group) | DSF neptune log group asset |
| <a name="output_instance"></a> [instance](#output\_instance) | Neptune instance |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | Neptune log group |
<!-- END_TF_DOCS -->