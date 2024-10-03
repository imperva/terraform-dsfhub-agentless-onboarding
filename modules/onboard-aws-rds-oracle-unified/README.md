# onboard-aws-rds-oracle-unified
Onboard Amazon RDS for Oracle (Unified Audit) to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from CloudWatch log groups.
2. A method to create an audit pull user, as well as an audit policy on the Oracle instance.

See the corresponding example for more details.


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_aws-rds-oracle-asset"></a> [aws-rds-oracle-asset](#module\_aws-rds-oracle-asset)

Source: ../dsfhub-aws-rds-oracle

Version:

### <a name="module_oracle-instance"></a> [oracle-instance](#module\_oracle-instance)

Source: ../aws-rds-instance

Version:

### <a name="module_oracle-parameter-group"></a> [oracle-parameter-group](#module\_oracle-parameter-group)

Source: ../aws-rds-parameter-group

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_aws_rds_oracle_admin_email"></a> [aws\_rds\_oracle\_admin\_email](#input\_aws\_rds\_oracle\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_rds_oracle_gateway_id"></a> [aws\_rds\_oracle\_gateway\_id](#input\_aws\_rds\_oracle\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_rds_oracle_password"></a> [aws\_rds\_oracle\_password](#input\_aws\_rds\_oracle\_password)

Description: Password to use to connect to Oracle database. Must not include semicolons.

Type: `string`

### <a name="input_aws_rds_oracle_username"></a> [aws\_rds\_oracle\_username](#input\_aws\_rds\_oracle\_username)

Description: Username to use to connect to Oracle database.

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

### <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family)

Description: The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_rds_oracle_audit_pull_enabled"></a> [aws\_rds\_oracle\_audit\_pull\_enabled](#input\_aws\_rds\_oracle\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_aws_rds_oracle_audit_type"></a> [aws\_rds\_oracle\_audit\_type](#input\_aws\_rds\_oracle\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details

Type: `string`

Default: `"UNIFIED"`

### <a name="input_aws_rds_oracle_auth_mechanism"></a> [aws\_rds\_oracle\_auth\_mechanism](#input\_aws\_rds\_oracle\_auth\_mechanism)

Description: Specifies the auth mechanism used by the connection

Type: `string`

Default: `"password"`

### <a name="input_aws_rds_oracle_dsn"></a> [aws\_rds\_oracle\_dsn](#input\_aws\_rds\_oracle\_dsn)

Description: Datasource name to use in odbc.ini. If using the asset for SDM, keep a dummy DSN value.

Type: `string`

Default: `null`

### <a name="input_aws_rds_oracle_reason"></a> [aws\_rds\_oracle\_reason](#input\_aws\_rds\_oracle\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_aws_rds_oracle_region"></a> [aws\_rds\_oracle\_region](#input\_aws\_rds\_oracle\_region)

Description: AWS region containing the instance.

Type: `string`

Default: `null`

### <a name="input_aws_rds_oracle_wallet_dir"></a> [aws\_rds\_oracle\_wallet\_dir](#input\_aws\_rds\_oracle\_wallet\_dir)

Description: Path to the Oracle wallet directory

Type: `string`

Default: `null`

### <a name="input_instance_allocated_storage"></a> [instance\_allocated\_storage](#input\_instance\_allocated\_storage)

Description: The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance.

Type: `number`

Default: `20`

### <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately)

Description: Specifies whether any database modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_instance_db_name"></a> [instance\_db\_name](#input\_instance\_db\_name)

Description: The Oracle System ID (SID) of the created RDS Custom DB instance.

Type: `string`

Default: `"ORCL"`

### <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection)

Description: If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true.

Type: `bool`

Default: `false`

### <a name="input_instance_enabled_cloudwatch_logs_exports"></a> [instance\_enabled\_cloudwatch\_logs\_exports](#input\_instance\_enabled\_cloudwatch\_logs\_exports)

Description: Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported.

Type: `list(string)`

Default: `null`

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
    "apply_method": "pending-reboot",
    "name": "audit_trail",
    "value": "DB,EXTENDED"
  },
  {
    "apply_method": "pending-reboot",
    "name": "audit_sys_operations",
    "value": "TRUE"
  }
]
```

### <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_aws-rds-oracle-asset"></a> [aws-rds-oracle-asset](#output\_aws-rds-oracle-asset)

Description: aws rds oracle asset

### <a name="output_oracle-instance"></a> [oracle-instance](#output\_oracle-instance)

Description: oracle instance

### <a name="output_oracle-parameter-group"></a> [oracle-parameter-group](#output\_oracle-parameter-group)

Description: oracle parameter group
<!-- END_TF_DOCS -->