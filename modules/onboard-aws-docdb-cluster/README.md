# onboard-aws-docdb-cluster
Onboard Amazon DocumentDB to DSF Hub.

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
| <a name="module_docdb-cluster"></a> [docdb-cluster](#module\_docdb-cluster) | ../aws-docdb-cluster | n/a |
| <a name="module_docdb-cluster-asset"></a> [docdb-cluster-asset](#module\_docdb-cluster-asset) | ../dsfhub-aws-docdb-cluster | n/a |
| <a name="module_docdb-cluster-instance"></a> [docdb-cluster-instance](#module\_docdb-cluster-instance) | ../aws-docdb-cluster-instance | n/a |
| <a name="module_docdb-log-group"></a> [docdb-log-group](#module\_docdb-log-group) | ../aws-cloudwatch-log-group | n/a |
| <a name="module_docdb-log-group-asset"></a> [docdb-log-group-asset](#module\_docdb-log-group-asset) | ../dsfhub-aws-log-group | n/a |
| <a name="module_docdb-param-group"></a> [docdb-param-group](#module\_docdb-param-group) | ../aws-docdb-cluster-parameter-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_docdb_cluster_admin_email"></a> [aws\_docdb\_cluster\_admin\_email](#input\_aws\_docdb\_cluster\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_aws_docdb_cluster_gateway_id"></a> [aws\_docdb\_cluster\_gateway\_id](#input\_aws\_docdb\_cluster\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_docdb_cluster_parent_asset_id"></a> [aws\_docdb\_cluster\_parent\_asset\_id](#input\_aws\_docdb\_cluster\_parent\_asset\_id) | The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events) | `string` | n/a | yes |
| <a name="input_aws_docdb_cluster_region"></a> [aws\_docdb\_cluster\_region](#input\_aws\_docdb\_cluster\_region) | AWS region of the DocumentDB Cluster. | `string` | n/a | yes |
| <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_log_group_reason"></a> [aws\_log\_group\_reason](#input\_aws\_log\_group\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_aws_log_group_region"></a> [aws\_log\_group\_region](#input\_aws\_log\_group\_region) | AWS region of the log group | `string` | n/a | yes |
| <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_cluster_db_subnet_group_name"></a> [cluster\_db\_subnet\_group\_name](#input\_cluster\_db\_subnet\_group\_name) | A DB subnet group to associate with this DB instance. | `string` | n/a | yes |
| <a name="input_cluster_deletion_protection"></a> [cluster\_deletion\_protection](#input\_cluster\_deletion\_protection) | A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. | `bool` | `false` | no |
| <a name="input_cluster_enabled_cloudwatch_logs_exports"></a> [cluster\_enabled\_cloudwatch\_logs\_exports](#input\_cluster\_enabled\_cloudwatch\_logs\_exports) | List of log types to export to CloudWatch. | `list(string)` | <pre>[<br>  "audit"<br>]</pre> | no |
| <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version) | Database engine version, e.g. "5.0.0" | `string` | `"5.0.0"` | no |
| <a name="input_cluster_final_snapshot_identifier"></a> [cluster\_final\_snapshot\_identifier](#input\_cluster\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made. Must be provided if skip\_final\_snapshot is set to false. | `string` | `null` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Identifier of DocumentDB Cluster. | `string` | n/a | yes |
| <a name="input_cluster_master_password"></a> [cluster\_master\_password](#input\_cluster\_master\_password) | Password for the master DB user. | `string` | n/a | yes |
| <a name="input_cluster_master_username"></a> [cluster\_master\_username](#input\_cluster\_master\_username) | Master DB username. | `string` | `"docdb"` | no |
| <a name="input_cluster_port"></a> [cluster\_port](#input\_cluster\_port) | The port on which the DB accepts connections. | `number` | `27017` | no |
| <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier | `bool` | `true` | no |
| <a name="input_cluster_storage_type"></a> [cluster\_storage\_type](#input\_cluster\_storage\_type) | The storage type to associate with the DB cluster. | `string` | `"standard"` | no |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | A map of tags to assign to the DB cluster. | `map(string)` | `null` | no |
| <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids) | List of VPC security groups to associate with the Cluster | `list(string)` | n/a | yes |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The number of instances to create in the DocumentDB cluster. | `number` | `1` | no |
| <a name="input_instance_instance_class"></a> [instance\_instance\_class](#input\_instance\_instance\_class) | The instance type of the DocumentDB cluster. Example: 'db.r5.large'. Reference: https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs | `string` | `"db.r5.large"` | no |
| <a name="input_instance_promotion_tier"></a> [instance\_promotion\_tier](#input\_instance\_promotion\_tier) | Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoted to a writer in case of failover. | `number` | `0` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | A map of tags to assign to the DocumentDB instance. | `map(string)` | `null` | no |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | The number of days to retain log events. | `number` | `7` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | The description of the DocumentDB cluster parameter group. | `string` | `"Managed by Terraform"` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | Database family version, e.g. "docdb5.0" | `string` | `"docdb5.0"` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the DocumentDB cluster parameter group. | `string` | `"docdb-parameter-group"` | no |
| <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters) | List of objects containing parameters for the DocumentDB parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate")<br>      value        = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "apply_method": "immediate",<br>    "name": "audit_logs",<br>    "value": "all"<br>  }<br>]</pre> | no |
| <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags) | A map of tags to assign to the cluster. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_docdb-cluster"></a> [docdb-cluster](#output\_docdb-cluster) | docdb cluster |
| <a name="output_docdb-cluster-asset"></a> [docdb-cluster-asset](#output\_docdb-cluster-asset) | docdb cluster asset |
| <a name="output_docdb-cluster-instance"></a> [docdb-cluster-instance](#output\_docdb-cluster-instance) | docdb cluster instance |
| <a name="output_docdb-log-group"></a> [docdb-log-group](#output\_docdb-log-group) | docdb log group |
| <a name="output_docdb-log-group-asset"></a> [docdb-log-group-asset](#output\_docdb-log-group-asset) | docdb log group asset |
| <a name="output_docdb-param-group"></a> [docdb-param-group](#output\_docdb-param-group) | docdb parameter group |
<!-- END_TF_DOCS -->