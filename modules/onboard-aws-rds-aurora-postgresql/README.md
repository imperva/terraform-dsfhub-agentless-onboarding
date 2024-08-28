# onboard-aws-rds-aurora-postgresql
Onboard Amazon Aurora PostgreSQL to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from CloudWatch log groups.
2. A method to create the 'pgaudit' extension and 'rds_pgaudit' role on the postgres instance.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aurora-postgresql-cluster"></a> [aurora-postgresql-cluster](#module\_aurora-postgresql-cluster) | ../aws-rds-cluster | n/a |
| <a name="module_aurora-postgresql-cluster-parameter-group"></a> [aurora-postgresql-cluster-parameter-group](#module\_aurora-postgresql-cluster-parameter-group) | ../aws-rds-cluster-parameter-group | n/a |
| <a name="module_aurora-postgresql-instance"></a> [aurora-postgresql-instance](#module\_aurora-postgresql-instance) | ../aws-rds-cluster-instance | n/a |
| <a name="module_aurora-postgresql-log-group"></a> [aurora-postgresql-log-group](#module\_aurora-postgresql-log-group) | ../aws-cloudwatch-log-group | n/a |
| <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset) | ../dsfhub-aws-log-group | n/a |
| <a name="module_aws-rds-aurora-postgresql-cluster-asset"></a> [aws-rds-aurora-postgresql-cluster-asset](#module\_aws-rds-aurora-postgresql-cluster-asset) | ../dsfhub-aws-rds-aurora-postgresql-cluster | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_aurora_postgresql_cluster_admin_email"></a> [aws\_aurora\_postgresql\_cluster\_admin\_email](#input\_aws\_aurora\_postgresql\_cluster\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_aurora_postgresql_cluster_audit_type"></a> [aws\_aurora\_postgresql\_cluster\_audit\_type](#input\_aws\_aurora\_postgresql\_cluster\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `"LOG_GROUP"` | no |
| <a name="input_aws_aurora_postgresql_cluster_gateway_id"></a> [aws\_aurora\_postgresql\_cluster\_gateway\_id](#input\_aws\_aurora\_postgresql\_cluster\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_aurora_postgresql_cluster_parent_asset_id"></a> [aws\_aurora\_postgresql\_cluster\_parent\_asset\_id](#input\_aws\_aurora\_postgresql\_cluster\_parent\_asset\_id) | The asset\_id of the cloud account with auth-mech such as key-pair, iam-role etc. | `string` | n/a | yes |
| <a name="input_aws_aurora_postgresql_cluster_region"></a> [aws\_aurora\_postgresql\_cluster\_region](#input\_aws\_aurora\_postgresql\_cluster\_region) | AWS region containing the cluster. | `string` | `null` | no |
| <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id) | The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'. | `string` | n/a | yes |
| <a name="input_aws_log_group_reason"></a> [aws\_log\_group\_reason](#input\_aws\_log\_group\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_aws_log_group_region"></a> [aws\_log\_group\_region](#input\_aws\_log\_group\_region) | AWS region of the log group | `string` | n/a | yes |
| <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `null` | no |
| <a name="input_cluster_backup_retention_period"></a> [cluster\_backup\_retention\_period](#input\_cluster\_backup\_retention\_period) | Days to retain backups for. | `number` | `null` | no |
| <a name="input_cluster_db_subnet_group_name"></a> [cluster\_db\_subnet\_group\_name](#input\_cluster\_db\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | `null` | no |
| <a name="input_cluster_enabled_cloudwatch_logs_exports"></a> [cluster\_enabled\_cloudwatch\_logs\_exports](#input\_cluster\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery. | `list(any)` | <pre>[<br>  "postgresql"<br>]</pre> | no |
| <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version) | Database engine version, e.g., 16.1 | `string` | `"16.1"` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The name of the RDS cluster | `string` | n/a | yes |
| <a name="input_cluster_master_password"></a> [cluster\_master\_password](#input\_cluster\_master\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | n/a | yes |
| <a name="input_cluster_master_username"></a> [cluster\_master\_username](#input\_cluster\_master\_username) | Username for the master DB user. | `string` | n/a | yes |
| <a name="input_cluster_network_type"></a> [cluster\_network\_type](#input\_cluster\_network\_type) | Network type of the cluster. Valid values: IPV4, DUAL | `string` | `null` | no |
| <a name="input_cluster_parameter_group_description"></a> [cluster\_parameter\_group\_description](#input\_cluster\_parameter\_group\_description) | The description of the DB cluster parameter group. | `string` | `null` | no |
| <a name="input_cluster_parameter_group_family"></a> [cluster\_parameter\_group\_family](#input\_cluster\_parameter\_group\_family) | The family of the DB cluster parameter group. | `string` | `"aurora-postgresql16"` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | The name of the DB cluster parameter group | `string` | n/a | yes |
| <a name="input_cluster_parameter_group_parameters"></a> [cluster\_parameter\_group\_parameters](#input\_cluster\_parameter\_group\_parameters) | List of objects containing parameters for the DB cluster parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate")<br>      value        = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "name": "log_connections",<br>    "value": 1<br>  },<br>  {<br>    "name": "log_disconnections",<br>    "value": 1<br>  },<br>  {<br>    "name": "log_error_verbosity",<br>    "value": "verbose"<br>  },<br>  {<br>    "name": "pgaudit.log",<br>    "value": "all"<br>  },<br>  {<br>    "name": "pgaudit.role",<br>    "value": "rds_pgaudit"<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "shared_preload_libraries",<br>    "value": "pgaudit,pg_stat_statements"<br>  }<br>]</pre> | no |
| <a name="input_cluster_parameter_group_tags"></a> [cluster\_parameter\_group\_tags](#input\_cluster\_parameter\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_cluster_port"></a> [cluster\_port](#input\_cluster\_port) | Port on which the DB accepts connections. | `number` | `null` | no |
| <a name="input_cluster_preferred_maintenance_window"></a> [cluster\_preferred\_maintenance\_window](#input\_cluster\_preferred\_maintenance\_window) | Weekly time range during which system maintenance can occur, in (UTC). | `string` | `null` | no |
| <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier. Default is true. | `bool` | `true` | no |
| <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(any)` | `null` | no |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `null` | no |
| <a name="input_instance_db_instance_class"></a> [instance\_db\_instance\_class](#input\_instance\_db\_instance\_class) | The instance type of the RDS cluster. Example: 'db.t3.micro' | `string` | `"db.t3.medium"` | no |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | The name of the Aurora PostgreSQL cluster instance | `string` | n/a | yes |
| <a name="input_instance_maintenance_schedule"></a> [instance\_maintenance\_schedule](#input\_instance\_maintenance\_schedule) | Weekly time range during which system maintenance can occur, in (UTC). | `string` | `null` | no |
| <a name="input_instance_minor_version_upgrade"></a> [instance\_minor\_version\_upgrade](#input\_instance\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | `bool` | `null` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | If instance is publicly accessible. Default false | `bool` | `null` | no |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire. | `number` | `7` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_log_group_asset"></a> [aws\_log\_group\_asset](#output\_aws\_log\_group\_asset) | AWS log group asset |
| <a name="output_aws_rds_aurora_postgresql_cluster_asset"></a> [aws\_rds\_aurora\_postgresql\_cluster\_asset](#output\_aws\_rds\_aurora\_postgresql\_cluster\_asset) | Aurora PostgreSQL cluster asset |
| <a name="output_cluster"></a> [cluster](#output\_cluster) | Aurora PostgreSQL Cluster |
| <a name="output_cluster_parameter_group"></a> [cluster\_parameter\_group](#output\_cluster\_parameter\_group) | Aurora PostgreSQL Cluster parameter group |
| <a name="output_instance"></a> [instance](#output\_instance) | Aurora PostgreSQL instance |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | Aurora PostgreSQL log group |
<!-- END_TF_DOCS -->