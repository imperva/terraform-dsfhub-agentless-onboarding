<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-rds-oracle-asset"></a> [aws-rds-oracle-asset](#module\_aws-rds-oracle-asset) | ../dsfhub-aws-rds-oracle | n/a |
| <a name="module_oracle-instance"></a> [oracle-instance](#module\_oracle-instance) | ../aws-rds-instance | n/a |
| <a name="module_oracle-parameter-group"></a> [oracle-parameter-group](#module\_oracle-parameter-group) | ../aws-rds-parameter-group | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_rds_oracle_admin_email"></a> [aws\_rds\_oracle\_admin\_email](#input\_aws\_rds\_oracle\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_rds_oracle_gateway_id"></a> [aws\_rds\_oracle\_gateway\_id](#input\_aws\_rds\_oracle\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_rds_oracle_password"></a> [aws\_rds\_oracle\_password](#input\_aws\_rds\_oracle\_password) | Password to use to connect to Oracle database. Must not include semicolons. | `string` | n/a | yes |
| <a name="input_aws_rds_oracle_username"></a> [aws\_rds\_oracle\_username](#input\_aws\_rds\_oracle\_username) | Username to use to connect to Oracle database. | `string` | n/a | yes |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | Identifier of RDS instance | `string` | n/a | yes |
| <a name="input_instance_password"></a> [instance\_password](#input\_instance\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | n/a | yes |
| <a name="input_instance_subnet_group_name"></a> [instance\_subnet\_group\_name](#input\_instance\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | n/a | yes |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc. | `string` | n/a | yes |
| <a name="input_aws_rds_oracle_audit_pull_enabled"></a> [aws\_rds\_oracle\_audit\_pull\_enabled](#input\_aws\_rds\_oracle\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_aws_rds_oracle_audit_type"></a> [aws\_rds\_oracle\_audit\_type](#input\_aws\_rds\_oracle\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `"UNIFIED"` | no |
| <a name="input_aws_rds_oracle_auth_mechanism"></a> [aws\_rds\_oracle\_auth\_mechanism](#input\_aws\_rds\_oracle\_auth\_mechanism) | Specifies the auth mechanism used by the connection | `string` | `"password"` | no |
| <a name="input_aws_rds_oracle_dsn"></a> [aws\_rds\_oracle\_dsn](#input\_aws\_rds\_oracle\_dsn) | Datasource name to use in odbc.ini. If using the asset for SDM, keep a dummy DSN value. | `string` | `null` | no |
| <a name="input_aws_rds_oracle_reason"></a> [aws\_rds\_oracle\_reason](#input\_aws\_rds\_oracle\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_aws_rds_oracle_region"></a> [aws\_rds\_oracle\_region](#input\_aws\_rds\_oracle\_region) | AWS region containing the instance. | `string` | `null` | no |
| <a name="input_aws_rds_oracle_wallet_dir"></a> [aws\_rds\_oracle\_wallet\_dir](#input\_aws\_rds\_oracle\_wallet\_dir) | Path to the Oracle wallet directory | `string` | `null` | no |
| <a name="input_instance_allocated_storage"></a> [instance\_allocated\_storage](#input\_instance\_allocated\_storage) | The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance. | `number` | `20` | no |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_instance_db_name"></a> [instance\_db\_name](#input\_instance\_db\_name) | The Oracle System ID (SID) of the created RDS Custom DB instance. | `string` | `"ORCL"` | no |
| <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection) | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. | `bool` | `false` | no |
| <a name="input_instance_enabled_cloudwatch_logs_exports"></a> [instance\_enabled\_cloudwatch\_logs\_exports](#input\_instance\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. | `list(string)` | `null` | no |
| <a name="input_instance_engine_version"></a> [instance\_engine\_version](#input\_instance\_engine\_version) | Database engine version, e.g. "8.0" | `string` | `null` | no |
| <a name="input_instance_final_snapshot_identifier"></a> [instance\_final\_snapshot\_identifier](#input\_instance\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false. | `string` | `null` | no |
| <a name="input_instance_instance_class"></a> [instance\_instance\_class](#input\_instance\_instance\_class) | The instance type of the RDS instance. | `string` | `"db.t3.small"` | no |
| <a name="input_instance_max_allocated_storage"></a> [instance\_max\_allocated\_storage](#input\_instance\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. | `number` | `null` | no |
| <a name="input_instance_option_group_name"></a> [instance\_option\_group\_name](#input\_instance\_option\_group\_name) | Name of the option group to associate with the RDS instance. | `string` | `null` | no |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | The port on which the DB accepts connections. | `string` | `null` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | Bool to control if instance is publicly accessible. | `bool` | `true` | no |
| <a name="input_instance_skip_final_snapshot"></a> [instance\_skip\_final\_snapshot](#input\_instance\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. | `bool` | `true` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | A map of tags to assign to the RDS instance. | `map(string)` | `null` | no |
| <a name="input_instance_username"></a> [instance\_username](#input\_instance\_username) | Username for the master DB user. | `string` | `"admin"` | no |
| <a name="input_instance_vpc_security_group_ids"></a> [instance\_vpc\_security\_group\_ids](#input\_instance\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(string)` | `null` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | The description of the DB parameter group. | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the DB parameter group. | `string` | `null` | no |
| <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters) | List of objects containing parameters for the DB parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate")<br>      value        = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "audit_trail",<br>    "value": "DB,EXTENDED"<br>  },<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "audit_sys_operations",<br>    "value": "TRUE"<br>  }<br>]</pre> | no |
| <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws-rds-oracle-asset"></a> [aws-rds-oracle-asset](#output\_aws-rds-oracle-asset) | aws rds oracle asset |
| <a name="output_oracle-instance"></a> [oracle-instance](#output\_oracle-instance) | oracle instance |
| <a name="output_oracle-parameter-group"></a> [oracle-parameter-group](#output\_oracle-parameter-group) | oracle parameter group |
<!-- END_TF_DOCS -->