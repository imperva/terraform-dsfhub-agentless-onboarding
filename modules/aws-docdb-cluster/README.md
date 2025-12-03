<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Identifier of AWS DocumentDB Cluster. | `string` | n/a | yes |
| <a name="input_db_cluster_parameter_group_name"></a> [db\_cluster\_parameter\_group\_name](#input\_db\_cluster\_parameter\_group\_name) | Name of the DocumentDB Cluster parameter group. | `string` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | A DB subnet group to associate with this DB instance. | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to export to CloudWatch. | `list(string)` | <pre>[<br>  "audit"<br>]</pre> | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Database engine version, e.g. "5.0.0" | `string` | `"5.0.0"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made. Must be provided if skip\_final\_snapshot is set to false. | `string` | `null` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Password for the master DB user. | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Master DB username. | `string` | `"docdb"` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections. | `number` | `27017` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier | `bool` | `true` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. Defaults to true. | `bool` | `true` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The storage type to associate with the DB cluster. | `string` | `"standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the DB cluster. | `map(string)` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate with the Cluster | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS DocumentDB Cluster |
<!-- END_TF_DOCS -->