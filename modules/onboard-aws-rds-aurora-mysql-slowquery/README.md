# onboard-aws-rds-aurora-mysql-slowquery
Onboard Amazon Aurora MySQL Slow query to DSF Hub.

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
| <a name="module_aurora-mysql-cluster"></a> [aurora-mysql-cluster](#module\_aurora-mysql-cluster) | ../aws-rds-cluster | n/a |
| <a name="module_aurora-mysql-cluster-parameter-group"></a> [aurora-mysql-cluster-parameter-group](#module\_aurora-mysql-cluster-parameter-group) | ../aws-rds-cluster-parameter-group | n/a |
| <a name="module_aurora-mysql-instances"></a> [aurora-mysql-instances](#module\_aurora-mysql-instances) | ../aws-rds-cluster-instance | n/a |
| <a name="module_aurora-mysql-log-group"></a> [aurora-mysql-log-group](#module\_aurora-mysql-log-group) | ../aws-cloudwatch-log-group | n/a |
| <a name="module_aurora-mysql-log-group-slowquery"></a> [aurora-mysql-log-group-slowquery](#module\_aurora-mysql-log-group-slowquery) | ../aws-cloudwatch-log-group | n/a |
| <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset) | ../dsfhub-aws-log-group | n/a |
| <a name="module_aws-log-group-slowquery-asset"></a> [aws-log-group-slowquery-asset](#module\_aws-log-group-slowquery-asset) | ../dsfhub-aws-log-group | n/a |
| <a name="module_aws-rds-aurora-mysql-cluster-asset"></a> [aws-rds-aurora-mysql-cluster-asset](#module\_aws-rds-aurora-mysql-cluster-asset) | ../dsfhub-aws-rds-aurora-mysql-cluster | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_aurora_mysql_cluster_admin_email"></a> [aws\_aurora\_mysql\_cluster\_admin\_email](#input\_aws\_aurora\_mysql\_cluster\_admin\_email) | The email address to notify about the assets. | `string` | `null` | no |
| <a name="input_aws_aurora_mysql_cluster_gateway_id"></a> [aws\_aurora\_mysql\_cluster\_gateway\_id](#input\_aws\_aurora\_mysql\_cluster\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | `null` | no |
| <a name="input_aws_aurora_mysql_cluster_parent_asset_id"></a> [aws\_aurora\_mysql\_cluster\_parent\_asset\_id](#input\_aws\_aurora\_mysql\_cluster\_parent\_asset\_id) | The asset\_id of the cloud account with auth-mech such as key-pair, iam-role etc. | `string` | `null` | no |
| <a name="input_aws_aurora_mysql_cluster_region"></a> [aws\_aurora\_mysql\_cluster\_region](#input\_aws\_aurora\_mysql\_cluster\_region) | AWS region containing the instance. | `string` | n/a | yes |
| <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled) | Turn on/off auditing on the data source and log aggregator | `bool` | `false` | no |
| <a name="input_aws_log_group_audit_type"></a> [aws\_log\_group\_audit\_type](#input\_aws\_log\_group\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `"LOG_GROUP"` | no |
| <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true | `bool` | `true` | no |
| <a name="input_cluster_backup_retention"></a> [cluster\_backup\_retention](#input\_cluster\_backup\_retention) | Days to retain backups for, Default is 1 day. | `number` | `1` | no |
| <a name="input_cluster_cluster_id"></a> [cluster\_cluster\_id](#input\_cluster\_cluster\_id) | The name of the aurora mysql cluster | `string` | n/a | yes |
| <a name="input_cluster_db_enabled_cloudwatch_logs_exports"></a> [cluster\_db\_enabled\_cloudwatch\_logs\_exports](#input\_cluster\_db\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery. | `list(any)` | <pre>[<br>  "audit",<br>  "slowquery"<br>]</pre> | no |
| <a name="input_cluster_db_engine"></a> [cluster\_db\_engine](#input\_cluster\_db\_engine) | Cluster engine i.e, aurora-mysql | `string` | `"aurora-mysql"` | no |
| <a name="input_cluster_db_engine_version"></a> [cluster\_db\_engine\_version](#input\_cluster\_db\_engine\_version) | Database engine version, i.e. 8.0.mysql\_aurora.3.05.1 | `string` | `"8.0.mysql_aurora.3.04.1"` | no |
| <a name="input_cluster_db_master_password"></a> [cluster\_db\_master\_password](#input\_cluster\_db\_master\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Cannot be set if manage\_master\_user\_password is set to true | `string` | n/a | yes |
| <a name="input_cluster_db_master_username"></a> [cluster\_db\_master\_username](#input\_cluster\_db\_master\_username) | Username for the master DB user, must not use rdsadmin as that is reserved. | `string` | n/a | yes |
| <a name="input_cluster_db_port"></a> [cluster\_db\_port](#input\_cluster\_db\_port) | Port on which the DB accepts connections. | `number` | `3306` | no |
| <a name="input_cluster_db_subnet_group_name"></a> [cluster\_db\_subnet\_group\_name](#input\_cluster\_db\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | `null` | no |
| <a name="input_cluster_final_snapshot"></a> [cluster\_final\_snapshot](#input\_cluster\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier. Default is false | `bool` | `true` | no |
| <a name="input_cluster_maintenance_schedule"></a> [cluster\_maintenance\_schedule](#input\_cluster\_maintenance\_schedule) | Weekly time range during which system maintenance can occur, in (UTC). | `string` | `"sun:18:00-sun:21:00"` | no |
| <a name="input_cluster_network_type"></a> [cluster\_network\_type](#input\_cluster\_network\_type) | Network type of the cluster. Valid values: IPV4, DUAL | `string` | `"IPV4"` | no |
| <a name="input_cluster_parameter_group_description"></a> [cluster\_parameter\_group\_description](#input\_cluster\_parameter\_group\_description) | The description of the DB cluster parameter group. | `string` | `"RDS aurora mysql cluster parameter group"` | no |
| <a name="input_cluster_parameter_group_family"></a> [cluster\_parameter\_group\_family](#input\_cluster\_parameter\_group\_family) | The family of the DB cluster parameter group. | `string` | `"aurora-mysql8.0"` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | The name of the DB cluster parameter group | `string` | n/a | yes |
| <a name="input_cluster_parameter_group_parameters"></a> [cluster\_parameter\_group\_parameters](#input\_cluster\_parameter\_group\_parameters) | List of objects containing parameters for the DB cluster parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate")<br>      value        = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "name": "server_audit_logging",<br>    "value": 1<br>  },<br>  {<br>    "name": "server_audit_excl_users",<br>    "value": "rdsadmin"<br>  },<br>  {<br>    "name": "server_audit_events",<br>    "value": "CONNECT,QUERY,QUERY_DCL,QUERY_DDL,QUERY_DML"<br>  },<br>  {<br>    "name": "slow_query_log",<br>    "value": 1<br>  },<br>  {<br>    "name": "long_query_time",<br>    "value": 0<br>  },<br>  {<br>    "name": "log_slow_admin_statements",<br>    "value": 1<br>  }<br>]</pre> | no |
| <a name="input_cluster_parameter_group_tags"></a> [cluster\_parameter\_group\_tags](#input\_cluster\_parameter\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(any)` | `null` | no |
| <a name="input_instance_db_instance_class"></a> [instance\_db\_instance\_class](#input\_instance\_db\_instance\_class) | The instance type of the RDS cluster. Example: 'db.t3.micro' | `string` | `"db.t3.medium"` | no |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | The name of the aurora mysql cluster instance | `string` | n/a | yes |
| <a name="input_instance_minor_version_upgrade"></a> [instance\_minor\_version\_upgrade](#input\_instance\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | `bool` | `false` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | If instance is publicly accessible. Default false | `bool` | `false` | no |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire. | `number` | `7` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | Aurora MySQL Cluster |
| <a name="output_cluster_parameter_group"></a> [cluster\_parameter\_group](#output\_cluster\_parameter\_group) | Aurora MySQL Cluster parameter group |
| <a name="output_dsf_aurora_mysql_cluster"></a> [dsf\_aurora\_mysql\_cluster](#output\_dsf\_aurora\_mysql\_cluster) | Aurora MySQL cluster DSF asset |
| <a name="output_dsf_aurora_mysql_log_group"></a> [dsf\_aurora\_mysql\_log\_group](#output\_dsf\_aurora\_mysql\_log\_group) | Aurora MySQL log group asset |
| <a name="output_dsf_aurora_mysql_log_group_slowquery"></a> [dsf\_aurora\_mysql\_log\_group\_slowquery](#output\_dsf\_aurora\_mysql\_log\_group\_slowquery) | Aurora MySQL slow query log group asset |
| <a name="output_instance"></a> [instance](#output\_instance) | Aurora MySQL instance |
| <a name="output_log_group"></a> [log\_group](#output\_log\_group) | Aurora MySQL log group |
| <a name="output_log_group_slowquery"></a> [log\_group\_slowquery](#output\_log\_group\_slowquery) | Aurora MySQL slow query log group |
<!-- END_TF_DOCS -->