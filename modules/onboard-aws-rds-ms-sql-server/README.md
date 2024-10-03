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

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

The following Modules are called:

### <a name="module_attach-rds-sql-server-iam-policy"></a> [attach-rds-sql-server-iam-policy](#module\_attach-rds-sql-server-iam-policy)

Source: ../aws-iam-role-policy-attachment

Version:

### <a name="module_aws-rds-ms-sql-server-asset"></a> [aws-rds-ms-sql-server-asset](#module\_aws-rds-ms-sql-server-asset)

Source: ../dsfhub-aws-rds-ms-sql-server

Version:

### <a name="module_rds-sql-server-db"></a> [rds-sql-server-db](#module\_rds-sql-server-db)

Source: ../aws-rds-instance

Version:

### <a name="module_rds-sql-server-option-group"></a> [rds-sql-server-option-group](#module\_rds-sql-server-option-group)

Source: ../aws-rds-option-group

Version:

### <a name="module_rds-sql-server-policy"></a> [rds-sql-server-policy](#module\_rds-sql-server-policy)

Source: ../aws-iam-policy

Version:

### <a name="module_rds-sql-server-role"></a> [rds-sql-server-role](#module\_rds-sql-server-role)

Source: ../aws-iam-role

Version:

### <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket)

Source: ../aws-s3-bucket

Version:

### <a name="module_s3-bucket-asset"></a> [s3-bucket-asset](#module\_s3-bucket-asset)

Source: ../dsfhub-aws-s3-bucket-la

Version:

## Resources

The following resources are used by this module:

- [aws_iam_policy_document.rds-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.rds-sql-server-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_aws_rds_mssql_admin_email"></a> [aws\_rds\_mssql\_admin\_email](#input\_aws\_rds\_mssql\_admin\_email)

Description: The email address to notify about this asset.

Type: `string`

### <a name="input_aws_rds_mssql_gateway_id"></a> [aws\_rds\_mssql\_gateway\_id](#input\_aws\_rds\_mssql\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_s3_admin_email"></a> [aws\_s3\_admin\_email](#input\_aws\_s3\_admin\_email)

Description: The email address to notify about the S3 asset.

Type: `string`

### <a name="input_aws_s3_gateway_id"></a> [aws\_s3\_gateway\_id](#input\_aws\_s3\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the S3 asset

Type: `string`

### <a name="input_aws_s3_parent_asset_id"></a> [aws\_s3\_parent\_asset\_id](#input\_aws\_s3\_parent\_asset\_id)

Description: The asset\_id of AWS cloud account being used.

Type: `string`

### <a name="input_aws_s3_region"></a> [aws\_s3\_region](#input\_aws\_s3\_region)

Description: AWS region containing the S3 bucket.

Type: `string`

### <a name="input_option_group_engine_name"></a> [option\_group\_engine\_name](#input\_option\_group\_engine\_name)

Description: Specifies the name of the engine that this option group should be associated with. Valid options: 'sqlserver-ee', 'sqlserver-ex', 'sqlserver-se', 'sqlserver-web'.

Type: `string`

### <a name="input_option_group_major_engine_version"></a> [option\_group\_major\_engine\_version](#input\_option\_group\_major\_engine\_version)

Description: Specifies the major version of the engine that this option group should be associated with. Supported options: '14.00', '15.00'.

Type: `string`

### <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name)

Description: The name of the RDS option group.

Type: `string`

### <a name="input_rds_mssql_identifier"></a> [rds\_mssql\_identifier](#input\_rds\_mssql\_identifier)

Description: The name of the RDS instance.

Type: `string`

### <a name="input_rds_mssql_password"></a> [rds\_mssql\_password](#input\_rds\_mssql\_password)

Description: Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.

Type: `string`

### <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket)

Description: The name of the bucket. Must be lowercase and less than or equal to 63 characters in length.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_rds_mssql_audit_pull_enabled"></a> [aws\_rds\_mssql\_audit\_pull\_enabled](#input\_aws\_rds\_mssql\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can. Default is false.

Type: `bool`

Default: `false`

### <a name="input_aws_rds_mssql_db_engine_version"></a> [aws\_rds\_mssql\_db\_engine\_version](#input\_aws\_rds\_mssql\_db\_engine\_version)

Description: Denotes the major version of the asset, e.g. 2017 or 2019.

Type: `string`

Default: `null`

### <a name="input_aws_rds_mssql_parent_asset_id"></a> [aws\_rds\_mssql\_parent\_asset\_id](#input\_aws\_rds\_mssql\_parent\_asset\_id)

Description: The asset\_id of the AWS cloud account that contains this asset.

Type: `string`

Default: `null`

### <a name="input_aws_rds_mssql_region"></a> [aws\_rds\_mssql\_region](#input\_aws\_rds\_mssql\_region)

Description: AWS region containing the instance.

Type: `string`

Default: `null`

### <a name="input_aws_s3_audit_pull_enabled"></a> [aws\_s3\_audit\_pull\_enabled](#input\_aws\_s3\_audit\_pull\_enabled)

Description: A boolean that indicates whether the asset should be audited. Default is true.

Type: `bool`

Default: `true`

### <a name="input_aws_s3_bucket_account_id"></a> [aws\_s3\_bucket\_account\_id](#input\_aws\_s3\_bucket\_account\_id)

Description: The account\_id of the bucket owner

Type: `string`

Default: `null`

### <a name="input_aws_s3_server_port"></a> [aws\_s3\_server\_port](#input\_aws\_s3\_server\_port)

Description: Port used by the source server. Default: 443

Type: `number`

Default: `443`

### <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count)

Description: The number of RDS instances to create. Default is 1.

Type: `number`

Default: `1`

### <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name)

Description: Friendly name of the IAM policy that grants SQL Server access to write to an S3 bucket. Forces new resource.

Type: `string`

Default: `"tf_rds_mssql_s3_audit_policy"`

### <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name)

Description: Friendly name of the IAM role that grants SQL Server access to write to an S3 bucket. Forces new resource.

Type: `string`

Default: `"tf_rds_mssql_s3_audit_role"`

### <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path)

Description: The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide. Default is '/service-role/'.

Type: `string`

Default: `"/service-role/"`

### <a name="input_option_group_additional_audit_option_settings"></a> [option\_group\_additional\_audit\_option\_settings](#input\_option\_group\_additional\_audit\_option\_settings)

Description: A list of additional option settings to apply to the SQLSERVER\_AUDIT option group.

Type:

```hcl
list(object({
    name  = string
    value = string
  }))
```

Default: `[]`

### <a name="input_option_group_additional_options"></a> [option\_group\_additional\_options](#input\_option\_group\_additional\_options)

Description: A list of additional options to apply to this Option Group.

Type:

```hcl
list(object({
    option_name = string
    option_settings = list(object({
      name  = string
      value = string
    }))
  }))
```

Default: `[]`

### <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description)

Description: The description of the RDS option group.

Type: `string`

Default: `null`

### <a name="input_option_group_tags"></a> [option\_group\_tags](#input\_option\_group\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_rds_mssql_allocated_storage"></a> [rds\_mssql\_allocated\_storage](#input\_rds\_mssql\_allocated\_storage)

Description: The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance. Default: 20.

Type: `number`

Default: `20`

### <a name="input_rds_mssql_apply_immediately"></a> [rds\_mssql\_apply\_immediately](#input\_rds\_mssql\_apply\_immediately)

Description: Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is true.

Type: `bool`

Default: `true`

### <a name="input_rds_mssql_db_name"></a> [rds\_mssql\_db\_name](#input\_rds\_mssql\_db\_name)

Description: The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance.

Type: `string`

Default: `null`

### <a name="input_rds_mssql_deletion_protection"></a> [rds\_mssql\_deletion\_protection](#input\_rds\_mssql\_deletion\_protection)

Description: If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. Default is false.

Type: `bool`

Default: `false`

### <a name="input_rds_mssql_final_snapshot_identifier"></a> [rds\_mssql\_final\_snapshot\_identifier](#input\_rds\_mssql\_final\_snapshot\_identifier)

Description: The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false.

Type: `string`

Default: `null`

### <a name="input_rds_mssql_instance_class"></a> [rds\_mssql\_instance\_class](#input\_rds\_mssql\_instance\_class)

Description: The instance type of the RDS instance. For supported range of DB instance classes for RDS SQL Server, see the [AWS Docs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.InstanceClasses) or use the /`aws rds describe-orderable-db-instance-options/` CLI command. Default: db.t3.xlarge

Type: `string`

Default: `"db.t3.xlarge"`

### <a name="input_rds_mssql_max_allocated_storage"></a> [rds\_mssql\_max\_allocated\_storage](#input\_rds\_mssql\_max\_allocated\_storage)

Description: When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage.

Type: `number`

Default: `null`

### <a name="input_rds_mssql_option_group_name"></a> [rds\_mssql\_option\_group\_name](#input\_rds\_mssql\_option\_group\_name)

Description: Name of the option group to associate with the RDS instance.

Type: `string`

Default: `null`

### <a name="input_rds_mssql_port"></a> [rds\_mssql\_port](#input\_rds\_mssql\_port)

Description: The port on which the DB accepts connections. Default: 1433

Type: `number`

Default: `1433`

### <a name="input_rds_mssql_publicly_accessible"></a> [rds\_mssql\_publicly\_accessible](#input\_rds\_mssql\_publicly\_accessible)

Description: Bool to control if instance is publicly accessible. Default is true.

Type: `bool`

Default: `true`

### <a name="input_rds_mssql_skip_final_snapshot"></a> [rds\_mssql\_skip\_final\_snapshot](#input\_rds\_mssql\_skip\_final\_snapshot)

Description: Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. Default is true.

Type: `bool`

Default: `true`

### <a name="input_rds_mssql_subnet_group_name"></a> [rds\_mssql\_subnet\_group\_name](#input\_rds\_mssql\_subnet\_group\_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

Default: `null`

### <a name="input_rds_mssql_tags"></a> [rds\_mssql\_tags](#input\_rds\_mssql\_tags)

Description: A map of tags to assign to the RDS instance.

Type: `map(string)`

Default: `null`

### <a name="input_rds_mssql_username"></a> [rds\_mssql\_username](#input\_rds\_mssql\_username)

Description: Username for the master DB user. Default: 'admin'.

Type: `string`

Default: `"admin"`

### <a name="input_rds_mssql_vpc_security_group_ids"></a> [rds\_mssql\_vpc\_security\_group\_ids](#input\_rds\_mssql\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate.

Type: `list(string)`

Default: `null`

### <a name="input_s3_bucket_prefix"></a> [s3\_bucket\_prefix](#input\_s3\_bucket\_prefix)

Description: The prefix to use for the S3 bucket. Required when auditing multiple RDS SQL Server instances sharing the same 'DB Identifier' across various regions or AWS accounts. Format: '/region/account\_id', e.g. '/us-east-1/123456789012'.

Type: `string`

Default: `""`

### <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy)

Description: A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. Default is false. See more details in the (AWS Terraform documentation)[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy].

Type: `bool`

Default: `false`

### <a name="input_s3_object_lock_enabled"></a> [s3\_object\_lock\_enabled](#input\_s3\_object\_lock\_enabled)

Description: A boolean that indicates whether this bucket should have an Object Lock configuration enabled. Default is false.

Type: `bool`

Default: `false`

### <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_attach-rds-sql-server-iam-policy"></a> [attach-rds-sql-server-iam-policy](#output\_attach-rds-sql-server-iam-policy)

Description: Attaching the IAM policy to the IAM role

### <a name="output_rds-sql-server-instance"></a> [rds-sql-server-instance](#output\_rds-sql-server-instance)

Description: RDS SQL Server instance(s)

### <a name="output_rds-sql-server-instance-asset"></a> [rds-sql-server-instance-asset](#output\_rds-sql-server-instance-asset)

Description: AWS RDS MS SQL SERVER asset(s)

### <a name="output_rds-sql-server-option-group"></a> [rds-sql-server-option-group](#output\_rds-sql-server-option-group)

Description: RDS option group

### <a name="output_rds-sql-server-policy"></a> [rds-sql-server-policy](#output\_rds-sql-server-policy)

Description: IAM policy giving RDS permissions to write to S3 bucket

### <a name="output_rds-sql-server-role"></a> [rds-sql-server-role](#output\_rds-sql-server-role)

Description: IAM role used in RDS option group

### <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket)

Description: S3 Bucket

### <a name="output_s3-bucket-asset"></a> [s3-bucket-asset](#output\_s3-bucket-asset)

Description: AWS S3 Bucket asset
<!-- END_TF_DOCS -->