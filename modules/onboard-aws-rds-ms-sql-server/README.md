# onboard-aws-rds-ms-sql-server
Onboard Amazon RDS for SQL Server to DSF Hub.

## Notes
There is one prerequisite for using this module:
1. A method to create an audit policy on the RDS SQL Server instance.

See the corresponding example for more details.
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_attach-rds-sql-server-iam-policy"></a> [attach-rds-sql-server-iam-policy](#module\_attach-rds-sql-server-iam-policy) | ../aws-iam-role-policy-attachment | n/a |
| <a name="module_aws-rds-ms-sql-server-asset"></a> [aws-rds-ms-sql-server-asset](#module\_aws-rds-ms-sql-server-asset) | ../dsfhub-aws-rds-ms-sql-server | n/a |
| <a name="module_rds-sql-server-db"></a> [rds-sql-server-db](#module\_rds-sql-server-db) | ../aws-rds-instance | n/a |
| <a name="module_rds-sql-server-option-group"></a> [rds-sql-server-option-group](#module\_rds-sql-server-option-group) | ../aws-rds-option-group | n/a |
| <a name="module_rds-sql-server-policy"></a> [rds-sql-server-policy](#module\_rds-sql-server-policy) | ../aws-iam-policy | n/a |
| <a name="module_rds-sql-server-role"></a> [rds-sql-server-role](#module\_rds-sql-server-role) | ../aws-iam-role | n/a |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | ../aws-s3-bucket | n/a |
| <a name="module_s3-bucket-asset"></a> [s3-bucket-asset](#module\_s3-bucket-asset) | ../dsfhub-aws-s3-bucket-la | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.rds-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.rds-sql-server-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_rds_mssql_admin_email"></a> [aws\_rds\_mssql\_admin\_email](#input\_aws\_rds\_mssql\_admin\_email) | The email address to notify about this asset. | `string` | n/a | yes |
| <a name="input_aws_rds_mssql_audit_pull_enabled"></a> [aws\_rds\_mssql\_audit\_pull\_enabled](#input\_aws\_rds\_mssql\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. Default is false. | `bool` | `false` | no |
| <a name="input_aws_rds_mssql_db_engine_version"></a> [aws\_rds\_mssql\_db\_engine\_version](#input\_aws\_rds\_mssql\_db\_engine\_version) | Denotes the major version of the asset, e.g. 2017 or 2019. | `string` | `null` | no |
| <a name="input_aws_rds_mssql_gateway_id"></a> [aws\_rds\_mssql\_gateway\_id](#input\_aws\_rds\_mssql\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_rds_mssql_parent_asset_id"></a> [aws\_rds\_mssql\_parent\_asset\_id](#input\_aws\_rds\_mssql\_parent\_asset\_id) | The asset\_id of the AWS cloud account that contains this asset. | `string` | `null` | no |
| <a name="input_aws_rds_mssql_region"></a> [aws\_rds\_mssql\_region](#input\_aws\_rds\_mssql\_region) | AWS region containing the instance. | `string` | `null` | no |
| <a name="input_aws_s3_admin_email"></a> [aws\_s3\_admin\_email](#input\_aws\_s3\_admin\_email) | The email address to notify about the S3 asset. | `string` | n/a | yes |
| <a name="input_aws_s3_audit_pull_enabled"></a> [aws\_s3\_audit\_pull\_enabled](#input\_aws\_s3\_audit\_pull\_enabled) | A boolean that indicates whether the asset should be audited. Default is true. | `bool` | `true` | no |
| <a name="input_aws_s3_bucket_account_id"></a> [aws\_s3\_bucket\_account\_id](#input\_aws\_s3\_bucket\_account\_id) | The account\_id of the bucket owner | `string` | `null` | no |
| <a name="input_aws_s3_gateway_id"></a> [aws\_s3\_gateway\_id](#input\_aws\_s3\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the S3 asset | `string` | n/a | yes |
| <a name="input_aws_s3_parent_asset_id"></a> [aws\_s3\_parent\_asset\_id](#input\_aws\_s3\_parent\_asset\_id) | The asset\_id of AWS cloud account being used. | `string` | n/a | yes |
| <a name="input_aws_s3_region"></a> [aws\_s3\_region](#input\_aws\_s3\_region) | AWS region containing the S3 bucket. | `string` | n/a | yes |
| <a name="input_aws_s3_server_port"></a> [aws\_s3\_server\_port](#input\_aws\_s3\_server\_port) | Port used by the source server. Default: 443 | `number` | `443` | no |
| <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count) | The number of RDS instances to create. Default is 1. | `number` | `1` | no |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | Friendly name of the IAM policy that grants SQL Server access to write to an S3 bucket. Forces new resource. | `string` | `"tf_rds_mssql_s3_audit_policy"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Friendly name of the IAM role that grants SQL Server access to write to an S3 bucket. Forces new resource. | `string` | `"tf_rds_mssql_s3_audit_role"` | no |
| <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path) | The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide. Default is '/service-role/'. | `string` | `"/service-role/"` | no |
| <a name="input_option_group_additional_audit_option_settings"></a> [option\_group\_additional\_audit\_option\_settings](#input\_option\_group\_additional\_audit\_option\_settings) | A list of additional option settings to apply to the SQLSERVER\_AUDIT option group. | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_option_group_additional_options"></a> [option\_group\_additional\_options](#input\_option\_group\_additional\_options) | A list of additional options to apply to this Option Group. | <pre>list(object({<br>    option_name = string<br>    option_settings = list(object({<br>      name  = string<br>      value = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description) | The description of the RDS option group. | `string` | `null` | no |
| <a name="input_option_group_engine_name"></a> [option\_group\_engine\_name](#input\_option\_group\_engine\_name) | Specifies the name of the engine that this option group should be associated with. Valid options: 'sqlserver-ee', 'sqlserver-ex', 'sqlserver-se', 'sqlserver-web'. | `string` | n/a | yes |
| <a name="input_option_group_major_engine_version"></a> [option\_group\_major\_engine\_version](#input\_option\_group\_major\_engine\_version) | Specifies the major version of the engine that this option group should be associated with. Supported options: '14.00', '15.00'. | `string` | n/a | yes |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | The name of the RDS option group. | `string` | n/a | yes |
| <a name="input_option_group_tags"></a> [option\_group\_tags](#input\_option\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_rds_mssql_allocated_storage"></a> [rds\_mssql\_allocated\_storage](#input\_rds\_mssql\_allocated\_storage) | The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance. Default: 20. | `number` | `20` | no |
| <a name="input_rds_mssql_apply_immediately"></a> [rds\_mssql\_apply\_immediately](#input\_rds\_mssql\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is true. | `bool` | `true` | no |
| <a name="input_rds_mssql_db_name"></a> [rds\_mssql\_db\_name](#input\_rds\_mssql\_db\_name) | The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. | `string` | `null` | no |
| <a name="input_rds_mssql_deletion_protection"></a> [rds\_mssql\_deletion\_protection](#input\_rds\_mssql\_deletion\_protection) | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. Default is false. | `bool` | `false` | no |
| <a name="input_rds_mssql_final_snapshot_identifier"></a> [rds\_mssql\_final\_snapshot\_identifier](#input\_rds\_mssql\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false. | `string` | `null` | no |
| <a name="input_rds_mssql_identifier"></a> [rds\_mssql\_identifier](#input\_rds\_mssql\_identifier) | The name of the RDS instance. | `string` | n/a | yes |
| <a name="input_rds_mssql_instance_class"></a> [rds\_mssql\_instance\_class](#input\_rds\_mssql\_instance\_class) | The instance type of the RDS instance. For supported range of DB instance classes for RDS SQL Server, see the [AWS Docs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.InstanceClasses) or use the /`aws rds describe-orderable-db-instance-options/` CLI command. Default: db.t3.xlarge | `string` | `"db.t3.xlarge"` | no |
| <a name="input_rds_mssql_max_allocated_storage"></a> [rds\_mssql\_max\_allocated\_storage](#input\_rds\_mssql\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. | `number` | `null` | no |
| <a name="input_rds_mssql_option_group_name"></a> [rds\_mssql\_option\_group\_name](#input\_rds\_mssql\_option\_group\_name) | Name of the option group to associate with the RDS instance. | `string` | `null` | no |
| <a name="input_rds_mssql_password"></a> [rds\_mssql\_password](#input\_rds\_mssql\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | n/a | yes |
| <a name="input_rds_mssql_port"></a> [rds\_mssql\_port](#input\_rds\_mssql\_port) | The port on which the DB accepts connections. Default: 1433 | `number` | `1433` | no |
| <a name="input_rds_mssql_publicly_accessible"></a> [rds\_mssql\_publicly\_accessible](#input\_rds\_mssql\_publicly\_accessible) | Bool to control if instance is publicly accessible. Default is true. | `bool` | `true` | no |
| <a name="input_rds_mssql_skip_final_snapshot"></a> [rds\_mssql\_skip\_final\_snapshot](#input\_rds\_mssql\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. Default is true. | `bool` | `true` | no |
| <a name="input_rds_mssql_subnet_group_name"></a> [rds\_mssql\_subnet\_group\_name](#input\_rds\_mssql\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | `null` | no |
| <a name="input_rds_mssql_tags"></a> [rds\_mssql\_tags](#input\_rds\_mssql\_tags) | A map of tags to assign to the RDS instance. | `map(string)` | `null` | no |
| <a name="input_rds_mssql_username"></a> [rds\_mssql\_username](#input\_rds\_mssql\_username) | Username for the master DB user. Default: 'admin'. | `string` | `"admin"` | no |
| <a name="input_rds_mssql_vpc_security_group_ids"></a> [rds\_mssql\_vpc\_security\_group\_ids](#input\_rds\_mssql\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(string)` | `null` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The name of the bucket. Must be lowercase and less than or equal to 63 characters in length. | `string` | n/a | yes |
| <a name="input_s3_bucket_prefix"></a> [s3\_bucket\_prefix](#input\_s3\_bucket\_prefix) | The prefix to use for the S3 bucket. Required when auditing multiple RDS SQL Server instances sharing the same 'DB Identifier' across various regions or AWS accounts. Format: '/region/account\_id', e.g. '/us-east-1/123456789012'. | `string` | `""` | no |
| <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. Default is false. See more details in the [AWS Terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy). | `bool` | `false` | no |
| <a name="input_s3_object_lock_enabled"></a> [s3\_object\_lock\_enabled](#input\_s3\_object\_lock\_enabled) | A boolean that indicates whether this bucket should have an Object Lock configuration enabled. Default is false. | `bool` | `false` | no |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attach-rds-sql-server-iam-policy"></a> [attach-rds-sql-server-iam-policy](#output\_attach-rds-sql-server-iam-policy) | Attaching the IAM policy to the IAM role |
| <a name="output_rds-sql-server-instance"></a> [rds-sql-server-instance](#output\_rds-sql-server-instance) | RDS SQL Server instance(s) |
| <a name="output_rds-sql-server-instance-asset"></a> [rds-sql-server-instance-asset](#output\_rds-sql-server-instance-asset) | AWS RDS MS SQL SERVER asset(s) |
| <a name="output_rds-sql-server-option-group"></a> [rds-sql-server-option-group](#output\_rds-sql-server-option-group) | RDS option group |
| <a name="output_rds-sql-server-policy"></a> [rds-sql-server-policy](#output\_rds-sql-server-policy) | IAM policy giving RDS permissions to write to S3 bucket |
| <a name="output_rds-sql-server-role"></a> [rds-sql-server-role](#output\_rds-sql-server-role) | IAM role used in RDS option group |
| <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket) | S3 Bucket |
| <a name="output_s3-bucket-asset"></a> [s3-bucket-asset](#output\_s3-bucket-asset) | AWS S3 Bucket asset |
<!-- END_TF_DOCS -->