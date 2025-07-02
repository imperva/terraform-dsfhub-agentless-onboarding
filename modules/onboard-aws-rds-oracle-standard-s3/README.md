# onboard-aws-rds-oracle-standard-s3
Onboard Amazon RDS for Oracle (Standard Audit via S3) to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from an S3 bucket.
2. A method to create an audit policy on the Oracle instance.

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
| <a name="module_aws-rds-oracle-asset"></a> [aws-rds-oracle-asset](#module\_aws-rds-oracle-asset) | ../dsfhub-aws-rds-oracle | n/a |
| <a name="module_aws-s3-asset"></a> [aws-s3-asset](#module\_aws-s3-asset) | ../dsfhub-aws-s3-bucket-la | n/a |
| <a name="module_firehose-log-group-iam-role-policy"></a> [firehose-log-group-iam-role-policy](#module\_firehose-log-group-iam-role-policy) | ../aws-iam-role-policy | n/a |
| <a name="module_firehose-s3-iam-role"></a> [firehose-s3-iam-role](#module\_firehose-s3-iam-role) | ../aws-iam-role | n/a |
| <a name="module_firehose-s3-iam-role-policy"></a> [firehose-s3-iam-role-policy](#module\_firehose-s3-iam-role-policy) | ../aws-iam-role-policy | n/a |
| <a name="module_kinesis-firehose-delivery-stream"></a> [kinesis-firehose-delivery-stream](#module\_kinesis-firehose-delivery-stream) | ../aws-kinesis-firehose-delivery-stream | n/a |
| <a name="module_log-group-firehose-iam-role"></a> [log-group-firehose-iam-role](#module\_log-group-firehose-iam-role) | ../aws-iam-role | n/a |
| <a name="module_log-group-firehose-iam-role-policy"></a> [log-group-firehose-iam-role-policy](#module\_log-group-firehose-iam-role-policy) | ../aws-iam-role-policy | n/a |
| <a name="module_oracle-instance"></a> [oracle-instance](#module\_oracle-instance) | ../aws-rds-instance | n/a |
| <a name="module_oracle-log-group"></a> [oracle-log-group](#module\_oracle-log-group) | ../aws-cloudwatch-log-group | n/a |
| <a name="module_oracle-log-group-subscription-filter"></a> [oracle-log-group-subscription-filter](#module\_oracle-log-group-subscription-filter) | ../aws-cloudwatch-log-subscription-filter | n/a |
| <a name="module_oracle-parameter-group"></a> [oracle-parameter-group](#module\_oracle-parameter-group) | ../aws-rds-parameter-group | n/a |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | ../aws-s3-bucket | n/a |
| <a name="module_s3-bucket-policy"></a> [s3-bucket-policy](#module\_s3-bucket-policy) | ../aws-s3-bucket-policy | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudwatch_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_to_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_to_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.log_group_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_rds_oracle_admin_email"></a> [aws\_rds\_oracle\_admin\_email](#input\_aws\_rds\_oracle\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_rds_oracle_audit_pull_enabled"></a> [aws\_rds\_oracle\_audit\_pull\_enabled](#input\_aws\_rds\_oracle\_audit\_pull\_enabled) | Whether the DSFHUB should pull logs from the asset. | `bool` | `false` | no |
| <a name="input_aws_rds_oracle_gateway_id"></a> [aws\_rds\_oracle\_gateway\_id](#input\_aws\_rds\_oracle\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_rds_oracle_parent_asset_id"></a> [aws\_rds\_oracle\_parent\_asset\_id](#input\_aws\_rds\_oracle\_parent\_asset\_id) | The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events) | `string` | n/a | yes |
| <a name="input_aws_rds_oracle_region"></a> [aws\_rds\_oracle\_region](#input\_aws\_rds\_oracle\_region) | AWS region containing the instance. | `string` | `null` | no |
| <a name="input_aws_s3_admin_email"></a> [aws\_s3\_admin\_email](#input\_aws\_s3\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_s3_audit_pull_enabled"></a> [aws\_s3\_audit\_pull\_enabled](#input\_aws\_s3\_audit\_pull\_enabled) | Whether the DSFHUB should pull logs from the asset. | `bool` | `false` | no |
| <a name="input_aws_s3_available_bucket_account_ids"></a> [aws\_s3\_available\_bucket\_account\_ids](#input\_aws\_s3\_available\_bucket\_account\_ids) | Mandatory for audit types: REDSHIFT, DYNAMODB and ORACLE. Account numbers found in the prefix of the files we are pulling. e.g: `123456789012` out of `redshift/AWSLogs/123456789012/redshift/us-east-1/2024/06/25/my_file.gz` | `list(string)` | `null` | no |
| <a name="input_aws_s3_available_regions"></a> [aws\_s3\_available\_regions](#input\_aws\_s3\_available\_regions) | A list of regions to use when pulling region specific audit logs from this bucket. | `list(string)` | `null` | no |
| <a name="input_aws_s3_gateway_id"></a> [aws\_s3\_gateway\_id](#input\_aws\_s3\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_s3_parent_asset_id"></a> [aws\_s3\_parent\_asset\_id](#input\_aws\_s3\_parent\_asset\_id) | The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default | `string` | n/a | yes |
| <a name="input_firehose_buffering_interval"></a> [firehose\_buffering\_interval](#input\_firehose\_buffering\_interval) | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300. | `number` | `300` | no |
| <a name="input_firehose_buffering_size"></a> [firehose\_buffering\_size](#input\_firehose\_buffering\_size) | Buffer incoming data to the specified size, in MiB, before delivering it to the destination. The default value is 10. | `number` | `10` | no |
| <a name="input_firehose_cloudwatch_logging_enabled"></a> [firehose\_cloudwatch\_logging\_enabled](#input\_firehose\_cloudwatch\_logging\_enabled) | Whether to enable CloudWatch logging for the Firehose delivery stream. Defaults to false. | `bool` | `false` | no |
| <a name="input_firehose_cloudwatch_logging_log_group_name"></a> [firehose\_cloudwatch\_logging\_log\_group\_name](#input\_firehose\_cloudwatch\_logging\_log\_group\_name) | The name of the CloudWatch log group to which Firehose will send logs. This value is required if enabled is true. | `string` | `null` | no |
| <a name="input_firehose_cloudwatch_logging_log_stream_name"></a> [firehose\_cloudwatch\_logging\_log\_stream\_name](#input\_firehose\_cloudwatch\_logging\_log\_stream\_name) | The name of the CloudWatch log stream to which Firehose will send logs. This value is required if enabled is true. | `string` | `null` | no |
| <a name="input_firehose_iam_role_description"></a> [firehose\_iam\_role\_description](#input\_firehose\_iam\_role\_description) | The description of the IAM role. | `string` | `"IAM role for sending RDS Oracle logs from Firehose to S3."` | no |
| <a name="input_firehose_iam_role_tags"></a> [firehose\_iam\_role\_tags](#input\_firehose\_iam\_role\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `null` | no |
| <a name="input_firehose_name"></a> [firehose\_name](#input\_firehose\_name) | A name to identify the stream. This is unique to the AWS account and region the Stream is created in. | `string` | n/a | yes |
| <a name="input_firehose_tags"></a> [firehose\_tags](#input\_firehose\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_firehose_to_s3_iam_role_name"></a> [firehose\_to\_s3\_iam\_role\_name](#input\_firehose\_to\_s3\_iam\_role\_name) | Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource. | `string` | `"oracle_firehose_role"` | no |
| <a name="input_firehose_to_s3_iam_role_name_prefix"></a> [firehose\_to\_s3\_iam\_role\_name\_prefix](#input\_firehose\_to\_s3\_iam\_role\_name\_prefix) | Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources. | `string` | `null` | no |
| <a name="input_firehose_to_s3_iam_role_policy_name"></a> [firehose\_to\_s3\_iam\_role\_policy\_name](#input\_firehose\_to\_s3\_iam\_role\_policy\_name) | The name of the IAM role policy that allows Firehose to send logs to S3. | `string` | `"firehose_to_s3_policy"` | no |
| <a name="input_instance_allocated_storage"></a> [instance\_allocated\_storage](#input\_instance\_allocated\_storage) | The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate\_source\_db is set, the value is ignored during the creation of the instance. | `number` | `20` | no |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The number of RDS Oracle instances to create. Defaults to 1. | `number` | `1` | no |
| <a name="input_instance_db_name"></a> [instance\_db\_name](#input\_instance\_db\_name) | The Oracle System ID (SID) of the created RDS Custom DB instance. The default is ORCL. | `string` | `"ORCL"` | no |
| <a name="input_instance_deletion_protection"></a> [instance\_deletion\_protection](#input\_instance\_deletion\_protection) | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. | `bool` | `false` | no |
| <a name="input_instance_enabled_cloudwatch_logs_exports"></a> [instance\_enabled\_cloudwatch\_logs\_exports](#input\_instance\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. | `list(string)` | <pre>[<br>  "audit"<br>]</pre> | no |
| <a name="input_instance_engine_version"></a> [instance\_engine\_version](#input\_instance\_engine\_version) | Database engine version, e.g. "8.0" | `string` | `null` | no |
| <a name="input_instance_final_snapshot_identifier"></a> [instance\_final\_snapshot\_identifier](#input\_instance\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false. | `string` | `null` | no |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | Identifier of RDS instance | `string` | n/a | yes |
| <a name="input_instance_identifier_postfixes"></a> [instance\_identifier\_postfixes](#input\_instance\_identifier\_postfixes) | Postfixes for the Oracle instance identifier in a many-to-one monitoring environment. If not set, numbers will be appended to the identifier. | `list(string)` | `null` | no |
| <a name="input_instance_instance_class"></a> [instance\_instance\_class](#input\_instance\_instance\_class) | The instance type of the RDS instance. The default is db.t3.small. | `string` | `"db.t3.small"` | no |
| <a name="input_instance_max_allocated_storage"></a> [instance\_max\_allocated\_storage](#input\_instance\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. | `number` | `null` | no |
| <a name="input_instance_option_group_name"></a> [instance\_option\_group\_name](#input\_instance\_option\_group\_name) | Name of the option group to associate with the RDS instance. | `string` | `null` | no |
| <a name="input_instance_password"></a> [instance\_password](#input\_instance\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | n/a | yes |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | The port on which the DB accepts connections. | `string` | `null` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | Bool to control if instance is publicly accessible. Default is true. | `bool` | `true` | no |
| <a name="input_instance_skip_final_snapshot"></a> [instance\_skip\_final\_snapshot](#input\_instance\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. Default is true. | `bool` | `true` | no |
| <a name="input_instance_subnet_group_name"></a> [instance\_subnet\_group\_name](#input\_instance\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | n/a | yes |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | A map of tags to assign to the RDS instance. | `map(string)` | `null` | no |
| <a name="input_instance_username"></a> [instance\_username](#input\_instance\_username) | Username for the master DB user. Defaults to "admin". | `string` | `"admin"` | no |
| <a name="input_instance_vpc_security_group_ids"></a> [instance\_vpc\_security\_group\_ids](#input\_instance\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(string)` | `null` | no |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire. | `number` | `7` | no |
| <a name="input_log_group_to_firehose_iam_role_description"></a> [log\_group\_to\_firehose\_iam\_role\_description](#input\_log\_group\_to\_firehose\_iam\_role\_description) | The description of the IAM role. | `string` | `"IAM role for sending RDS Oracle logs from Firehose to S3."` | no |
| <a name="input_log_group_to_firehose_iam_role_name"></a> [log\_group\_to\_firehose\_iam\_role\_name](#input\_log\_group\_to\_firehose\_iam\_role\_name) | Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource. | `string` | `"log_group_to_firehose_iam_role"` | no |
| <a name="input_log_group_to_firehose_iam_role_name_prefix"></a> [log\_group\_to\_firehose\_iam\_role\_name\_prefix](#input\_log\_group\_to\_firehose\_iam\_role\_name\_prefix) | Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources. | `string` | `null` | no |
| <a name="input_log_group_to_firehose_iam_role_policy_name"></a> [log\_group\_to\_firehose\_iam\_role\_policy\_name](#input\_log\_group\_to\_firehose\_iam\_role\_policy\_name) | The name of the IAM role policy that allows the log group to send logs to Firehose. | `string` | `"log_group_to_firehose_policy"` | no |
| <a name="input_log_group_to_firehose_iam_role_tags"></a> [log\_group\_to\_firehose\_iam\_role\_tags](#input\_log\_group\_to\_firehose\_iam\_role\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `null` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | The description of the DB parameter group. | `string` | `null` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc. | `string` | n/a | yes |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the DB parameter group. | `string` | `null` | no |
| <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters) | List of objects containing parameters for the DB parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate")<br>      value        = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "apply_method": "pending-reboot",<br>    "name": "audit_trail",<br>    "value": "OS"<br>  }<br>]</pre> | no |
| <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The name of the bucket. Must be lowercase and less than or equal to 63 characters in length. | `string` | n/a | yes |
| <a name="input_s3_bucket_prefix"></a> [s3\_bucket\_prefix](#input\_s3\_bucket\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length. | `string` | `null` | no |
| <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy). | `bool` | `false` | no |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_subscription_filter_name"></a> [subscription\_filter\_name](#input\_subscription\_filter\_name) | A name for the subscription filter. | `string` | `"oracle_log_group_subscription_filter"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws-rds-oracle-asset"></a> [aws-rds-oracle-asset](#output\_aws-rds-oracle-asset) | AWS RDS Oracle asset(s) |
| <a name="output_aws-s3-bucket-asset"></a> [aws-s3-bucket-asset](#output\_aws-s3-bucket-asset) | AWS S3 asset |
| <a name="output_firehose-log-group-iam-role-policy"></a> [firehose-log-group-iam-role-policy](#output\_firehose-log-group-iam-role-policy) | Firehose to Log Group IAM role policy |
| <a name="output_firehose-s3-iam-role"></a> [firehose-s3-iam-role](#output\_firehose-s3-iam-role) | Firehose to S3 IAM role |
| <a name="output_firehose-s3-iam-role-policy"></a> [firehose-s3-iam-role-policy](#output\_firehose-s3-iam-role-policy) | Firehose to S3 IAM role policy |
| <a name="output_kinesis-firehose-delivery-stream"></a> [kinesis-firehose-delivery-stream](#output\_kinesis-firehose-delivery-stream) | Firehose delivery stream to S3 |
| <a name="output_log-group-firehose-iam-role"></a> [log-group-firehose-iam-role](#output\_log-group-firehose-iam-role) | Log group to Firehose IAM role |
| <a name="output_log-group-firehose-iam-role-policy"></a> [log-group-firehose-iam-role-policy](#output\_log-group-firehose-iam-role-policy) | Log group to Firehose IAM role policy |
| <a name="output_oracle-instance"></a> [oracle-instance](#output\_oracle-instance) | RDS Oracle instance(s) |
| <a name="output_oracle-log-group"></a> [oracle-log-group](#output\_oracle-log-group) | AWS log group(s) |
| <a name="output_oracle-log-group-subscription-filter"></a> [oracle-log-group-subscription-filter](#output\_oracle-log-group-subscription-filter) | Log group subscription filter(s) |
| <a name="output_oracle-parameter-group"></a> [oracle-parameter-group](#output\_oracle-parameter-group) | RDS parameter group for Oracle |
| <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket) | S3 bucket |
| <a name="output_s3-bucket-policy"></a> [s3-bucket-policy](#output\_s3-bucket-policy) | S3 bucket policy |
<!-- END_TF_DOCS -->