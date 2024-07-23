# onboard-aws-rds-aurora-mysql-kinesis
Onboard Amazon Aurora MySQL to DSF Hub using a kinesis stream.

## Notes
There is one prerequisite for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from Kinesis streams.

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
| <a name="module_aurora-mysql-cluster"></a> [aurora-mysql-cluster](#module\_aurora-mysql-cluster) | ../aws-rds-cluster | n/a |
| <a name="module_aurora-mysql-cluster-activity-stream"></a> [aurora-mysql-cluster-activity-stream](#module\_aurora-mysql-cluster-activity-stream) | ../aws-rds-cluster-activity-stream | n/a |
| <a name="module_aurora-mysql-instance"></a> [aurora-mysql-instance](#module\_aurora-mysql-instance) | ../aws-rds-cluster-instance | n/a |
| <a name="module_aws-kinesis-asset"></a> [aws-kinesis-asset](#module\_aws-kinesis-asset) | ../dsfhub-aws-kinesis | n/a |
| <a name="module_aws-kms-key"></a> [aws-kms-key](#module\_aws-kms-key) | ../aws-kms-key | n/a |
| <a name="module_aws-rds-aurora-mysql-cluster-asset"></a> [aws-rds-aurora-mysql-cluster-asset](#module\_aws-rds-aurora-mysql-cluster-asset) | ../dsfhub-aws-rds-aurora-mysql-cluster | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_arn.aurora_mysql_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_aurora_mysql_cluster_admin_email"></a> [aws\_aurora\_mysql\_cluster\_admin\_email](#input\_aws\_aurora\_mysql\_cluster\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_aurora_mysql_cluster_gateway_id"></a> [aws\_aurora\_mysql\_cluster\_gateway\_id](#input\_aws\_aurora\_mysql\_cluster\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_aurora_mysql_cluster_parent_asset_id"></a> [aws\_aurora\_mysql\_cluster\_parent\_asset\_id](#input\_aws\_aurora\_mysql\_cluster\_parent\_asset\_id) | The asset\_id of the cloud account with auth-mech such as key-pair, iam-role etc. | `string` | n/a | yes |
| <a name="input_aws_aurora_mysql_cluster_region"></a> [aws\_aurora\_mysql\_cluster\_region](#input\_aws\_aurora\_mysql\_cluster\_region) | AWS region containing the cluster. | `string` | `null` | no |
| <a name="input_aws_kinesis_admin_email"></a> [aws\_kinesis\_admin\_email](#input\_aws\_kinesis\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_aws_kinesis_audit_pull_enabled"></a> [aws\_kinesis\_audit\_pull\_enabled](#input\_aws\_kinesis\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_aws_kinesis_gateway_id"></a> [aws\_kinesis\_gateway\_id](#input\_aws\_kinesis\_gateway\_id) | The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'. | `string` | n/a | yes |
| <a name="input_aws_kinesis_reason"></a> [aws\_kinesis\_reason](#input\_aws\_kinesis\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_aws_kinesis_region"></a> [aws\_kinesis\_region](#input\_aws\_kinesis\_region) | AWS region of the kinesis stream | `string` | `null` | no |
| <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true | `bool` | `null` | no |
| <a name="input_cluster_backup_retention"></a> [cluster\_backup\_retention](#input\_cluster\_backup\_retention) | Days to retain backups for, Default is 1 day. | `number` | `null` | no |
| <a name="input_cluster_db_enabled_cloudwatch_logs_exports"></a> [cluster\_db\_enabled\_cloudwatch\_logs\_exports](#input\_cluster\_db\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery. | `list(any)` | `null` | no |
| <a name="input_cluster_db_engine_version"></a> [cluster\_db\_engine\_version](#input\_cluster\_db\_engine\_version) | Database engine version, i.e. 8.0.mysql\_aurora.3.05.1 | `string` | `null` | no |
| <a name="input_cluster_db_master_password"></a> [cluster\_db\_master\_password](#input\_cluster\_db\_master\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Cannot be set if manage\_master\_user\_password is set to true | `string` | n/a | yes |
| <a name="input_cluster_db_master_username"></a> [cluster\_db\_master\_username](#input\_cluster\_db\_master\_username) | Username for the master DB user, must not use rdsadmin as that is reserved. | `string` | n/a | yes |
| <a name="input_cluster_db_port"></a> [cluster\_db\_port](#input\_cluster\_db\_port) | Port on which the DB accepts connections. | `number` | `null` | no |
| <a name="input_cluster_db_subnet_group_name"></a> [cluster\_db\_subnet\_group\_name](#input\_cluster\_db\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. | `string` | `null` | no |
| <a name="input_cluster_final_snapshot"></a> [cluster\_final\_snapshot](#input\_cluster\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier. Default is false | `bool` | `null` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The name of the Aurora MySQL cluster | `string` | n/a | yes |
| <a name="input_cluster_maintenance_schedule"></a> [cluster\_maintenance\_schedule](#input\_cluster\_maintenance\_schedule) | Weekly time range during which system maintenance can occur, in (UTC). | `string` | `null` | no |
| <a name="input_cluster_network_type"></a> [cluster\_network\_type](#input\_cluster\_network\_type) | Network type of the cluster. Valid values: IPV4, DUAL | `string` | `null` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | Cluster parameter group associated with the cluster | `string` | `null` | no |
| <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids) | List of VPC security groups to associate. | `list(any)` | `null` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The instance type of the RDS cluster. Supported instance classes for database activity streams can be found at https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.Overview.html#DBActivityStreams.Overview.requirements.classes. | `string` | `"db.r5.large"` | no |
| <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true | `bool` | `true` | no |
| <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier) | The name of the aurora mysql cluster instance | `string` | n/a | yes |
| <a name="input_instance_maintenance_schedule"></a> [instance\_maintenance\_schedule](#input\_instance\_maintenance\_schedule) | Weekly time range during which system maintenance can occur, in (UTC). | `string` | `null` | no |
| <a name="input_instance_minor_version_upgrade"></a> [instance\_minor\_version\_upgrade](#input\_instance\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | `bool` | `null` | no |
| <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible) | If instance is publicly accessible. Default false | `bool` | `null` | no |
| <a name="input_key_custom_master_key_spec"></a> [key\_custom\_master\_key\_spec](#input\_key\_custom\_master\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, HMAC\_256, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1. | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_key_deletion_window_in_days"></a> [key\_deletion\_window\_in\_days](#input\_key\_deletion\_window\_in\_days) | The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. | `number` | `30` | no |
| <a name="input_key_description"></a> [key\_description](#input\_key\_description) | The description of the key as viewed in AWS console. | `string` | `"AWS KMS Key to encrypt Aurora MySQL Database Activity Stream."` | no |
| <a name="input_key_is_enabled"></a> [key\_is\_enabled](#input\_key\_is\_enabled) | Specifies whether the key is enabled. | `bool` | `true` | no |
| <a name="input_key_multi_region"></a> [key\_multi\_region](#input\_key\_multi\_region) | Indicates whether the KMS key is a multi-Region (true) or regional (false) key. | `bool` | `false` | no |
| <a name="input_key_tags"></a> [key\_tags](#input\_key\_tags) | A map of tags to assign to the object. | `map(string)` | `null` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | Specifies the intended use of the key. Valid values: ENCRYPT\_DECRYPT, SIGN\_VERIFY, GENERATE\_VERIFY\_MAC. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_stream_mode"></a> [stream\_mode](#input\_stream\_mode) | Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async. | `string` | `"async"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activity_stream"></a> [activity\_stream](#output\_activity\_stream) | Aurora MySQL kinesis activity stream |
| <a name="output_aws_kinesis_asset"></a> [aws\_kinesis\_asset](#output\_aws\_kinesis\_asset) | AWS Kinesis stream asset |
| <a name="output_aws_rds_aurora_mysql_cluster_asset"></a> [aws\_rds\_aurora\_mysql\_cluster\_asset](#output\_aws\_rds\_aurora\_mysql\_cluster\_asset) | Aurora MySQL cluster asset |
| <a name="output_cluster"></a> [cluster](#output\_cluster) | Aurora MySQL Cluster |
| <a name="output_instance"></a> [instance](#output\_instance) | Aurora MySQL Cluster instance |
| <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key) | AWS KMS Key |
<!-- END_TF_DOCS -->