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

- [aws_neptune_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `null`

### <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period)

Description: The days to retain backups for.

Type: `number`

Default: `null`

### <a name="input_enable_cloudwatch_logs_exports"></a> [enable\_cloudwatch\_logs\_exports](#input\_enable\_cloudwatch\_logs\_exports)

Description: A list of the log types this DB cluster is configured to export to Cloudwatch Logs. Currently only supports audit and slowquery

Type: `list(string)`

Default: `null`

### <a name="input_engine"></a> [engine](#input\_engine)

Description: The name of the database engine to be used for this Neptune cluster.

Type: `string`

Default: `null`

### <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version)

Description: The database engine version.

Type: `string`

Default: `null`

### <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled)

Description:  Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled.

Type: `bool`

Default: `null`

### <a name="input_identifier"></a> [identifier](#input\_identifier)

Description: The cluster identifier

Type: `string`

Default: `null`

### <a name="input_neptune_subnet_group_name"></a> [neptune\_subnet\_group\_name](#input\_neptune\_subnet\_group\_name)

Description: A subnet group to associate with this neptune instance.

Type: `string`

Default: `null`

### <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name)

Description: cluster parameter group to associate with the cluster

Type: `string`

Default: `null`

### <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window)

Description: Weekly time range during which system maintenance can occur, in (UTC).

Type: `string`

Default: `null`

### <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot)

Description: Determines whether a final Neptune snapshot is created before the Neptune cluster is deleted. If true is specified, no Neptune snapshot is created. If false is specified, a Neptune snapshot is created before the Neptune cluster is deleted, using the value from final\_snapshot\_identifier

Type: `bool`

Default: `null`

### <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type)

Description: Storage type associated with the cluster standard/iopt1. Default: standard

Type: `string`

Default: `null`

### <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate with the Cluster

Type: `list(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS Neptune cluster
<!-- END_TF_DOCS -->