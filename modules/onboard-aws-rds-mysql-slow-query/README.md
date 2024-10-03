# onboard-aws-rds-mysql-slow-query
Onboard Amazon RDS for MySQL with slow query to DSF Hub.

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

The following Modules are called:

### <a name="module_aws-log-group-audit-asset"></a> [aws-log-group-audit-asset](#module\_aws-log-group-audit-asset)

Source: ../dsfhub-aws-log-group

Version:

### <a name="module_aws-log-group-slow-query-asset"></a> [aws-log-group-slow-query-asset](#module\_aws-log-group-slow-query-asset)

Source: ../dsfhub-aws-log-group

Version:

### <a name="module_aws-rds-mysql-asset"></a> [aws-rds-mysql-asset](#module\_aws-rds-mysql-asset)

Source: ../dsfhub-aws-rds-mysql

Version:

### <a name="module_mysql-audit-log-group"></a> [mysql-audit-log-group](#module\_mysql-audit-log-group)

Source: ../aws-cloudwatch-log-group

Version:

### <a name="module_mysql-instance"></a> [mysql-instance](#module\_mysql-instance)

Source: ../aws-rds-instance

Version:

### <a name="module_mysql-option-group"></a> [mysql-option-group](#module\_mysql-option-group)

Source: ../aws-rds-option-group

Version:

### <a name="module_mysql-parameter-group"></a> [mysql-parameter-group](#module\_mysql-parameter-group)

Source: ../aws-rds-parameter-group

Version:

### <a name="module_mysql-slow-query-log-group"></a> [mysql-slow-query-log-group](#module\_mysql-slow-query-log-group)

Source: ../aws-cloudwatch-log-group

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

### <a name="input_aws_rds_mysql_admin_email"></a> [aws\_rds\_mysql\_admin\_email](#input\_aws\_rds\_mysql\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_rds_mysql_gateway_id"></a> [aws\_rds\_mysql\_gateway\_id](#input\_aws\_rds\_mysql\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_rds_mysql_parent_asset_id"></a> [aws\_rds\_mysql\_parent\_asset\_id](#input\_aws\_rds\_mysql\_parent\_asset\_id)

Description: The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events)

Type: `string`

### <a name="input_aws_rds_mysql_region"></a> [aws\_rds\_mysql\_region](#input\_aws\_rds\_mysql\_region)

Description: AWS region containing the instance.

Type: `string`

### <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier)

Description: Identifier of RDS instance

Type: `string`

### <a name="input_instance_password"></a> [instance\_password](#input\_instance\_password)

Description: Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.

Type: `string`

### <a name="input_instance_subnet_group_name"></a> [instance\_subnet\_group\_name](#input\_instance\_subnet\_group\_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

### <a name="input_option_group_major_engine_version"></a> [option\_group\_major\_engine\_version](#input\_option\_group\_major\_engine\_version)

Description: value

Type: `any`

### <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name)

Description: The name of the DB option group.

Type: `string`

### <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family)

Description: The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_aws_rds_mysql_audit_type"></a> [aws\_rds\_mysql\_audit\_type](#input\_aws\_rds\_mysql\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details

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
  "audit",
  "slowquery"
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

### <a name="input_instance_instance_class"></a> [instance\_instance\_class](#input\_instance\_instance\_class)

Description: The instance type of the RDS instance.

Type: `string`

Default: `"db.t3.small"`

### <a name="input_instance_max_allocated_storage"></a> [instance\_max\_allocated\_storage](#input\_instance\_max\_allocated\_storage)

Description: When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage.

Type: `number`

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

### <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description)

Description: The description of the DB option group.

Type: `string`

Default: `null`

### <a name="input_option_group_options"></a> [option\_group\_options](#input\_option\_group\_options)

Description: List of objects containing options for the DB option group.

Type:

```hcl
list(
    object({
      option_name = string
      option_settings = optional(
        list(
          object({
            name  = string
            value = string
          })
        ),
        null
      )
      port                           = optional(string, null)
      version                        = optional(string, null)
      db_security_group_memberships  = optional(list(string), null)
      vpc_security_group_memberships = optional(list(string), null)
    })
  )
```

Default:

```json
[
  {
    "option_name": "MARIADB_AUDIT_PLUGIN",
    "option_settings": [
      {
        "name": "SERVER_AUDIT_EVENTS",
        "value": "CONNECT,QUERY,QUERY_DDL,QUERY_DML,QUERY_DCL"
      },
      {
        "name": "SERVER_AUDIT_EXCL_USERS",
        "value": "rdsadmin"
      }
    ]
  }
]
```

### <a name="input_option_group_tags"></a> [option\_group\_tags](#input\_option\_group\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description)

Description: The description of the DB parameter group.

Type: `string`

Default: `null`

### <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name)

Description: The name of the DB parameter group.

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
    "name": "slow_query_log",
    "value": 1
  },
  {
    "name": "long_query_time",
    "value": 60
  },
  {
    "name": "log_output",
    "value": "FILE"
  },
  {
    "name": "log_slow_admin_statements",
    "value": 1
  }
]
```

### <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_aws-log-group-audit-asset"></a> [aws-log-group-audit-asset](#output\_aws-log-group-audit-asset)

Description: aws log group audit asset

### <a name="output_aws-log-group-slow-query-asset"></a> [aws-log-group-slow-query-asset](#output\_aws-log-group-slow-query-asset)

Description: aws log group slow query asset

### <a name="output_aws-rds-mysql-asset"></a> [aws-rds-mysql-asset](#output\_aws-rds-mysql-asset)

Description: aws rds mysql asset

### <a name="output_mysql-audit-log-group"></a> [mysql-audit-log-group](#output\_mysql-audit-log-group)

Description: mysql audit log group

### <a name="output_mysql-instance"></a> [mysql-instance](#output\_mysql-instance)

Description: mysql instance

### <a name="output_mysql-option-group"></a> [mysql-option-group](#output\_mysql-option-group)

Description: mysql option group

### <a name="output_mysql-slow-query-log-group"></a> [mysql-slow-query-log-group](#output\_mysql-slow-query-log-group)

Description: mysql slow query log group
<!-- END_TF_DOCS -->