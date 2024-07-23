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
| [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true | `bool` | `null` | no |
| <a name="input_backup_retention"></a> [backup\_retention](#input\_backup\_retention) | Days to retain backups for, Default is 1 day. | `number` | `null` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The name of the RDS cluster | `string` | n/a | yes |
| <a name="input_db_enabled_cloudwatch_logs_exports"></a> [db\_enabled\_cloudwatch\_logs\_exports](#input\_db\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery. | `list(any)` | `null` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | Cluster engine e.g., aurora-mysql | `string` | `null` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | Database engine version, e.g., 8.0.mysql\_aurora.3.05.1 | `string` | `null` | no |
| <a name="input_db_master_password"></a> [db\_master\_password](#input\_db\_master\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Cannot be set if manage\_master\_user\_password is set to true | `string` | n/a | yes |
| <a name="input_db_master_username"></a> [db\_master\_username](#input\_db\_master\_username) | Username for the master DB user, must not use rdsadmin as that is reserved. | `string` | n/a | yes |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | Port on which the DB accepts connections. | `number` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | `null` | no |
| <a name="input_final_snapshot"></a> [final\_snapshot](#input\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier. Default is false | `bool` | `null` | no |
| <a name="input_maintenance_schedule"></a> [maintenance\_schedule](#input\_maintenance\_schedule) | Weekly time range during which system maintenance can occur, in (UTC). | `string` | `null` | no |
| <a name="input_network_type"></a> [network\_type](#input\_network\_type) | Network type of the cluster. Valid values: IPV4, DUAL | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Cluster parameter group associated with the cluster | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | RDS Aurora cluster |
<!-- END_TF_DOCS -->