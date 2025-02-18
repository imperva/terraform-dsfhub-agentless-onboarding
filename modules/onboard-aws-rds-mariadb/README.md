# onboard-aws-rds-mariadb
Onboard Amazon RDS for MariaDB to DSF Hub.

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
| <a name="module_aws-rds-mariadb-asset"></a> [aws-rds-mariadb-asset](#module\_aws-rds-mariadb-asset) | ../dsfhub-aws-rds-mariadb | n/a |
| <a name="module_mariadb-instance"></a> [mariadb-instance](#module\_mariadb-instance) | ../aws-rds-instance | n/a |
| <a name="module_mariadb-log-group"></a> [mariadb-log-group](#module\_mariadb-log-group) | ../aws-cloudwatch-log-group | n/a |
| <a name="module_mariadb-option-group"></a> [mariadb-option-group](#module\_mariadb-option-group) | ../aws-rds-option-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id) | The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'. | `string` | n/a | yes |
| <a name="input_aws_log_group_region"></a> [aws\_log\_group\_region](#input\_aws\_log\_group\_region) | AWS region of the log group | `string` | n/a | yes |
| <a name="input_aws_rds_mariadb_admin_email"></a> [aws\_rds\_mariadb\_admin\_email](#input\_aws\_rds\_mariadb\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_rds_mariadb_gateway_id"></a> [aws\_rds\_mariadb\_gateway\_id](#input\_aws\_rds\_mariadb\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_rds_mariadb_parent_asset_id"></a> [aws\_rds\_mariadb\_parent\_asset\_id](#input\_aws\_rds\_mariadb\_parent\_asset\_id) | The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events) | `string` | n/a | yes |
| <a name="input_aws_rds_mariadb_region"></a> [aws\_rds\_mariadb\_region](#input\_aws\_rds\_mariadb\_region) | AWS region containing the instance. | `string` | n/a | yes |
| <a name="input_instance_allocated_storage"></a> [instance\_allocated\_storage](#input\_instance\_allocated\_storage) | The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance. | `number` | `20` | no |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_instance_db_name"></a> [instance\_db\_name](#input\_instance\_db\_name) | The name of the database to create when the DB instance is created. | `string` | `"testdb"` | no |
| <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection) | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. | `bool` | `false` | no |
| <a name="input_instance_enabled_cloudwatch_logs_exports"></a> [instance\_enabled\_cloudwatch\_logs\_exports](#input\_instance\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. | `list(string)` | `null` | no |
| <a name="input_instance_engine_version"></a> [instance\_engine\_version](#input\_instance\_engine\_version) | Database engine version, e.g. "8.0" | `string` | `null` | no |
| <a name="input_instance_final_snapshot_identifier"></a> [instance\_final\_snapshot\_identifier](#input\_instance\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false. | `string` | `null` | no |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | Identifier of RDS instance | `string` | n/a | yes |
| <a name="input_instance_instance_class"></a> [instance\_instance\_class](#input\_instance\_instance\_class) | The instance type of the RDS instance. | `string` | `"db.t3.small"` | no |
| <a name="input_instance_max_allocated_storage"></a> [instance\_max\_allocated\_storage](#input\_instance\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. | `number` | `null` | no |
| <a name="input_instance_parameter_group_name"></a> [instance\_parameter\_group\_name](#input\_instance\_parameter\_group\_name) | Name of the parameter group to associate with the RDS instance. | `string` | `null` | no |
| <a name="input_instance_password"></a> [instance\_password](#input\_instance\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | n/a | yes |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | The port on which the DB accepts connections. | `string` | `null` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | Bool to control if instance is publicly accessible. | `bool` | `true` | no |
| <a name="input_instance_skip_final_snapshot"></a> [instance\_skip\_final\_snapshot](#input\_instance\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. | `bool` | `true` | no |
| <a name="input_instance_subnet_group_name"></a> [instance\_subnet\_group\_name](#input\_instance\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | n/a | yes |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | A map of tags to assign to the RDS instance. | `map(string)` | `null` | no |
| <a name="input_instance_username"></a> [instance\_username](#input\_instance\_username) | Username for the master DB user. | `string` | `"admin"` | no |
| <a name="input_instance_vpc_security_group_ids"></a> [instance\_vpc\_security\_group\_ids](#input\_instance\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(string)` | `null` | no |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire. | `number` | `7` | no |
| <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description) | The description of the DB option group. | `string` | `null` | no |
| <a name="input_option_group_major_engine_version"></a> [option\_group\_major\_engine\_version](#input\_option\_group\_major\_engine\_version) | Specifies the major version of the engine that this option group should be associated with. | `any` | n/a | yes |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | The name of the DB option group. | `string` | n/a | yes |
| <a name="input_option_group_options"></a> [option\_group\_options](#input\_option\_group\_options) | List of objects containing options for the DB option group. | <pre>list(<br>    object({<br>      option_name = string<br>      option_settings = optional(<br>        list(<br>          object({<br>            name  = string<br>            value = string<br>          })<br>        ),<br>        null<br>      )<br>      port                           = optional(string, null)<br>      version                        = optional(string, null)<br>      db_security_group_memberships  = optional(list(string), null)<br>      vpc_security_group_memberships = optional(list(string), null)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_option_group_tags"></a> [option\_group\_tags](#input\_option\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws-log-group-asset"></a> [aws-log-group-asset](#output\_aws-log-group-asset) | aws log group asset |
| <a name="output_aws-rds-mariadb-asset"></a> [aws-rds-mariadb-asset](#output\_aws-rds-mariadb-asset) | aws rds mariadb asset |
| <a name="output_mariadb-instance"></a> [mariadb-instance](#output\_mariadb-instance) | mariadb instance |
| <a name="output_mariadb-log-group"></a> [mariadb-log-group](#output\_mariadb-log-group) | mariadb log group |
| <a name="output_mariadb-option-group"></a> [mariadb-option-group](#output\_mariadb-option-group) | mariadb option group |
<!-- END_TF_DOCS -->