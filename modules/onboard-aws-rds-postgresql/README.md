# onboard-aws-rds-postgresql
Onboard Amazon RDS for PostgreSQL to DSF Hub.

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

The following Modules are called:

### <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset)

Source: ../dsfhub-aws-log-group

Version:

### <a name="module_aws-rds-postgresql-asset"></a> [aws-rds-postgresql-asset](#module\_aws-rds-postgresql-asset)

Source: ../dsfhub-aws-rds-postgresql

Version:

### <a name="module_postgres-instance"></a> [postgres-instance](#module\_postgres-instance)

Source: ../aws-rds-instance

Version:

### <a name="module_postgres-log-group"></a> [postgres-log-group](#module\_postgres-log-group)

Source: ../aws-cloudwatch-log-group

Version:

### <a name="module_postgres-parameter-group"></a> [postgres-parameter-group](#module\_postgres-parameter-group)

Source: ../aws-rds-parameter-group

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id)

Description: The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'.

Type: `string`

### <a name="input_aws_log_group_region"></a> [aws\_log\_group\_region](#input\_aws\_log\_group\_region)

Description: AWS region of the log group

Type: `string`

### <a name="input_aws_rds_postgresql_admin_email"></a> [aws\_rds\_postgresql\_admin\_email](#input\_aws\_rds\_postgresql\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_rds_postgresql_gateway_id"></a> [aws\_rds\_postgresql\_gateway\_id](#input\_aws\_rds\_postgresql\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_rds_postgresql_parent_asset_id"></a> [aws\_rds\_postgresql\_parent\_asset\_id](#input\_aws\_rds\_postgresql\_parent\_asset\_id)

Description: The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events)

Type: `string`

### <a name="input_aws_rds_postgresql_region"></a> [aws\_rds\_postgresql\_region](#input\_aws\_rds\_postgresql\_region)

Description: AWS region containing the instance.

Type: `string`

### <a name="input_instance_engine"></a> [instance\_engine](#input\_instance\_engine)

Description: The database engine to use. For supported values, see the Engine parameter in https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html

Type: `any`

### <a name="input_instance_password"></a> [instance\_password](#input\_instance\_password)

Description: Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.

Type: `string`

### <a name="input_instance_subnet_group_name"></a> [instance\_subnet\_group\_name](#input\_instance\_subnet\_group\_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

### <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family)

Description: The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc.

Type: `string`

### <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name)

Description: The name of the DB parameter group.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_aws_log_group_reason"></a> [aws\_log\_group\_reason](#input\_aws\_log\_group\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_aws_rds_postgresql_audit_type"></a> [aws\_rds\_postgresql\_audit\_type](#input\_aws\_rds\_postgresql\_audit\_type)

Description: Determines what mapping/gateway service will handle the asset.

Type: `string`

Default: `"LOG_GROUP"`

### <a name="input_instance_allocated_storage"></a> [instance\_allocated\_storage](#input\_instance\_allocated\_storage)

Description: The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance.

Type: `number`

Default: `20`

### <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately)

Description: Specifies whether any database modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_instance_db_name"></a> [instance\_db\_name](#input\_instance\_db\_name)

Description: The name of the database to create when the DB instance is created.

Type: `string`

Default: `"testdb"`

### <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection)

Description: If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true.

Type: `bool`

Default: `false`

### <a name="input_instance_enabled_cloudwatch_logs_exports"></a> [instance\_enabled\_cloudwatch\_logs\_exports](#input\_instance\_enabled\_cloudwatch\_logs\_exports)

Description: Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported.

Type: `list(string)`

Default:

```json
[
  "postgresql"
]
```

### <a name="input_instance_engine_version"></a> [instance\_engine\_version](#input\_instance\_engine\_version)

Description: Database engine version, e.g. "8.0"

Type: `string`

Default: `null`

### <a name="input_instance_final_snapshot_identifier"></a> [instance\_final\_snapshot\_identifier](#input\_instance\_final\_snapshot\_identifier)

Description: The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false.

Type: `string`

Default: `null`

### <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier)

Description: Identifier of RDS instance

Type: `string`

Default: `"rds-mysql"`

### <a name="input_instance_instance_class"></a> [instance\_instance\_class](#input\_instance\_instance\_class)

Description: The instance type of the RDS instance.

Type: `string`

Default: `"db.t3.small"`

### <a name="input_instance_max_allocated_storage"></a> [instance\_max\_allocated\_storage](#input\_instance\_max\_allocated\_storage)

Description: When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage.

Type: `number`

Default: `null`

### <a name="input_instance_option_group_name"></a> [instance\_option\_group\_name](#input\_instance\_option\_group\_name)

Description: Name of the option group to associate with the RDS instance.

Type: `string`

Default: `null`

### <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port)

Description: The port on which the DB accepts connections.

Type: `string`

Default: `null`

### <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible)

Description: Bool to control if instance is publicly accessible.

Type: `bool`

Default: `true`

### <a name="input_instance_skip_final_snapshot"></a> [instance\_skip\_final\_snapshot](#input\_instance\_skip\_final\_snapshot)

Description: Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier.

Type: `bool`

Default: `true`

### <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags)

Description: A map of tags to assign to the RDS instance.

Type: `map(string)`

Default: `null`

### <a name="input_instance_username"></a> [instance\_username](#input\_instance\_username)

Description: Username for the master DB user.

Type: `string`

Default: `"admin"`

### <a name="input_instance_vpc_security_group_ids"></a> [instance\_vpc\_security\_group\_ids](#input\_instance\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate.

Type: `list(string)`

Default: `null`

### <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days)

Description: Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire.

Type: `number`

Default: `7`

### <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description)

Description: parameter group description

Type: `string`

Default: `null`

### <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters)

Description: List of objects containing parameters for the DB parameter group.

Type:

```hcl
list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
```

Default:

```json
[
  {
    "name": "log_connections",
    "value": 1
  },
  {
    "name": "log_disconnections",
    "value": 1
  },
  {
    "name": "log_error_verbosity",
    "value": "verbose"
  },
  {
    "name": "pgaudit.role",
    "value": "rds_pgaudit"
  },
  {
    "name": "pgaudit.log",
    "value": "all"
  },
  {
    "apply_method": "pending-reboot",
    "name": "shared_preload_libraries",
    "value": "pgaudit"
  }
]
```

### <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_aws-log-group-asset"></a> [aws-log-group-asset](#output\_aws-log-group-asset)

Description: aws log group asset

### <a name="output_aws-rds-postgresql-asset"></a> [aws-rds-postgresql-asset](#output\_aws-rds-postgresql-asset)

Description: aws rds postgresql asset

### <a name="output_postgres-instance"></a> [postgres-instance](#output\_postgres-instance)

Description: postgres instance

### <a name="output_postgres-log-group"></a> [postgres-log-group](#output\_postgres-log-group)

Description: postgres audit log group

### <a name="output_postgres-parameter-group"></a> [postgres-parameter-group](#output\_postgres-parameter-group)

Description: postgres parameter group
<!-- END_TF_DOCS -->