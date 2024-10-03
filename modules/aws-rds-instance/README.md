<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_engine"></a> [engine](#input\_engine)

Description: The database engine to use. For supported values, see the Engine parameter in https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html

Type: `any`

### <a name="input_identifier"></a> [identifier](#input\_identifier)

Description: Identifier of RDS instance

Type: `string`

### <a name="input_password"></a> [password](#input\_password)

Description: Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.

Type: `string`

### <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage)

Description: The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance.

Type: `number`

Default: `20`

### <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately)

Description: Specifies whether any database modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_db_name"></a> [db\_name](#input\_db\_name)

Description: The name of the database to create when the DB instance is created.

Type: `string`

Default: `"testdb"`

### <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection)

Description: If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true.

Type: `bool`

Default: `false`

### <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports)

Description: Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported.

Type: `list(string)`

Default: `null`

### <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version)

Description: Database engine version, e.g. "8.0"

Type: `string`

Default: `null`

### <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier)

Description: The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false.

Type: `string`

Default: `null`

### <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class)

Description: The instance type of the RDS instance.

Type: `string`

Default: `"db.t3.small"`

### <a name="input_license_model"></a> [license\_model](#input\_license\_model)

Description: License model information for this DB instance.

Type: `string`

Default: `null`

### <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage)

Description: When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage.

Type: `number`

Default: `null`

### <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name)

Description: Name of the option group to associate with the RDS instance.

Type: `string`

Default: `null`

### <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name)

Description: Name of the parameter group to associate with the RDS instance.

Type: `string`

Default: `null`

### <a name="input_port"></a> [port](#input\_port)

Description: The port on which the DB accepts connections.

Type: `string`

Default: `null`

### <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible)

Description: Bool to control if instance is publicly accessible.

Type: `bool`

Default: `true`

### <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot)

Description: Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier.

Type: `bool`

Default: `true`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the RDS instance.

Type: `map(string)`

Default: `null`

### <a name="input_username"></a> [username](#input\_username)

Description: Username for the master DB user.

Type: `string`

Default: `"admin"`

### <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate.

Type: `list(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: RDS instance
<!-- END_TF_DOCS -->