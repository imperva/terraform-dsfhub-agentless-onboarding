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

- [aws_docdb_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: Identifier of AWS DocumentDB Cluster.

Type: `string`

### <a name="input_db_cluster_parameter_group_name"></a> [db\_cluster\_parameter\_group\_name](#input\_db\_cluster\_parameter\_group\_name)

Description: Name of the DocumentDB Cluster parameter group.

Type: `string`

### <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name)

Description: A DB subnet group to associate with this DB instance.

Type: `string`

### <a name="input_master_password"></a> [master\_password](#input\_master\_password)

Description: Password for the master DB user.

Type: `string`

### <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate with the Cluster

Type: `list(string)`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection)

Description: A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled.

Type: `bool`

Default: `false`

### <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports)

Description: List of log types to export to CloudWatch.

Type: `list(string)`

Default:

```json
[
  "audit"
]
```

### <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version)

Description: Database engine version, e.g. "5.0.0"

Type: `string`

Default: `"5.0.0"`

### <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier)

Description: The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made. Must be provided if skip\_final\_snapshot is set to false.

Type: `string`

Default: `null`

### <a name="input_master_username"></a> [master\_username](#input\_master\_username)

Description: Master DB username.

Type: `string`

Default: `"docdb"`

### <a name="input_port"></a> [port](#input\_port)

Description: The port on which the DB accepts connections.

Type: `number`

Default: `27017`

### <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot)

Description: Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier

Type: `bool`

Default: `true`

### <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type)

Description: The storage type to associate with the DB cluster.

Type: `string`

Default: `"standard"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the DB cluster.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS DocumentDB Cluster
<!-- END_TF_DOCS -->