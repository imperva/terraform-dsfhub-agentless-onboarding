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

- [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: The cluster identifier.

Type: `string`

### <a name="input_master_password"></a> [master\_password](#input\_master\_password)

Description: Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.

Type: `string`

### <a name="input_master_username"></a> [master\_username](#input\_master\_username)

Description: Username for the master DB user, must not use rdsadmin as that is reserved.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `null`

### <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period)

Description: Days to retain backups for.

Type: `number`

Default: `null`

### <a name="input_db_cluster_parameter_group_name"></a> [db\_cluster\_parameter\_group\_name](#input\_db\_cluster\_parameter\_group\_name)

Description: A cluster parameter group to associate with the cluster.

Type: `string`

Default: `null`

### <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name)

Description: DB subnet group to associate with this DB cluster. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

Default: `null`

### <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports)

Description: Set of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, error, general, slowquery, postgresql (PostgreSQL).

Type: `list(string)`

Default: `null`

### <a name="input_engine"></a> [engine](#input\_engine)

Description: Name of the database engine to be used for this DB cluster. Valid Values: aurora-mysql, aurora-postgresql, mysql, postgres. (Note that mysql and postgres are Multi-AZ RDS clusters).

Type: `string`

Default: `null`

### <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version)

Description: Database engine version, e.g., 8.0.mysql\_aurora.3.05.1

Type: `string`

Default: `null`

### <a name="input_network_type"></a> [network\_type](#input\_network\_type)

Description:  Network type of the cluster. Valid values: IPV4, DUAL

Type: `string`

Default: `null`

### <a name="input_port"></a> [port](#input\_port)

Description: Port on which the DB accepts connections.

Type: `number`

Default: `null`

### <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window)

Description: Weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30.

Type: `string`

Default: `null`

### <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot)

Description: Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier.

Type: `bool`

Default: `null`

### <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate with the cluster.

Type: `list(any)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: RDS Aurora cluster
<!-- END_TF_DOCS -->