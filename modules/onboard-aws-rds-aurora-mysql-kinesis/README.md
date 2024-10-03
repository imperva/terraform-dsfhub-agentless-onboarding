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

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

The following Modules are called:

### <a name="module_aurora-mysql-cluster"></a> [aurora-mysql-cluster](#module\_aurora-mysql-cluster)

Source: ../aws-rds-cluster

Version:

### <a name="module_aurora-mysql-cluster-activity-stream"></a> [aurora-mysql-cluster-activity-stream](#module\_aurora-mysql-cluster-activity-stream)

Source: ../aws-rds-cluster-activity-stream

Version:

### <a name="module_aurora-mysql-instance"></a> [aurora-mysql-instance](#module\_aurora-mysql-instance)

Source: ../aws-rds-cluster-instance

Version:

### <a name="module_aws-kinesis-asset"></a> [aws-kinesis-asset](#module\_aws-kinesis-asset)

Source: ../dsfhub-aws-kinesis

Version:

### <a name="module_aws-kms-key"></a> [aws-kms-key](#module\_aws-kms-key)

Source: ../aws-kms-key

Version:

### <a name="module_aws-rds-aurora-mysql-cluster-asset"></a> [aws-rds-aurora-mysql-cluster-asset](#module\_aws-rds-aurora-mysql-cluster-asset)

Source: ../dsfhub-aws-rds-aurora-mysql-cluster

Version:

## Resources

The following resources are used by this module:

- [aws_arn.aurora_mysql_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) (data source)
- [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_aws_aurora_mysql_cluster_admin_email"></a> [aws\_aurora\_mysql\_cluster\_admin\_email](#input\_aws\_aurora\_mysql\_cluster\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_aurora_mysql_cluster_gateway_id"></a> [aws\_aurora\_mysql\_cluster\_gateway\_id](#input\_aws\_aurora\_mysql\_cluster\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_aurora_mysql_cluster_parent_asset_id"></a> [aws\_aurora\_mysql\_cluster\_parent\_asset\_id](#input\_aws\_aurora\_mysql\_cluster\_parent\_asset\_id)

Description: The asset\_id of the cloud account with auth-mech such as key-pair, iam-role etc.

Type: `string`

### <a name="input_aws_kinesis_admin_email"></a> [aws\_kinesis\_admin\_email](#input\_aws\_kinesis\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_aws_kinesis_gateway_id"></a> [aws\_kinesis\_gateway\_id](#input\_aws\_kinesis\_gateway\_id)

Description: The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'.

Type: `string`

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: The name of the Aurora MySQL cluster

Type: `string`

### <a name="input_cluster_master_password"></a> [cluster\_master\_password](#input\_cluster\_master\_password)

Description: Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Cannot be set if manage\_master\_user\_password is set to true

Type: `string`

### <a name="input_cluster_master_username"></a> [cluster\_master\_username](#input\_cluster\_master\_username)

Description: Username for the master DB user, must not use rdsadmin as that is reserved.

Type: `string`

### <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier)

Description: The name of the Aurora MySQL cluster instance

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_aurora_mysql_cluster_region"></a> [aws\_aurora\_mysql\_cluster\_region](#input\_aws\_aurora\_mysql\_cluster\_region)

Description: AWS region containing the cluster.

Type: `string`

Default: `null`

### <a name="input_aws_kinesis_audit_pull_enabled"></a> [aws\_kinesis\_audit\_pull\_enabled](#input\_aws\_kinesis\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_aws_kinesis_reason"></a> [aws\_kinesis\_reason](#input\_aws\_kinesis\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_aws_kinesis_region"></a> [aws\_kinesis\_region](#input\_aws\_kinesis\_region)

Description: AWS region of the kinesis stream

Type: `string`

Default: `null`

### <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true.

Type: `bool`

Default: `true`

### <a name="input_cluster_backup_retention_period"></a> [cluster\_backup\_retention\_period](#input\_cluster\_backup\_retention\_period)

Description: Days to retain backups for, Default is 1 day.

Type: `number`

Default: `1`

### <a name="input_cluster_db_subnet_group_name"></a> [cluster\_db\_subnet\_group\_name](#input\_cluster\_db\_subnet\_group\_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

Default: `null`

### <a name="input_cluster_enabled_cloudwatch_logs_exports"></a> [cluster\_enabled\_cloudwatch\_logs\_exports](#input\_cluster\_enabled\_cloudwatch\_logs\_exports)

Description: Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery.

Type: `list(any)`

Default: `null`

### <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version)

Description: Database engine version, i.e. 8.0.mysql\_aurora.3.05.1

Type: `string`

Default: `null`

### <a name="input_cluster_network_type"></a> [cluster\_network\_type](#input\_cluster\_network\_type)

Description:  Network type of the cluster. Valid values: IPV4, DUAL

Type: `string`

Default: `null`

### <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name)

Description: Cluster parameter group associated with the cluster

Type: `string`

Default: `null`

### <a name="input_cluster_port"></a> [cluster\_port](#input\_cluster\_port)

Description: Port on which the DB accepts connections.

Type: `number`

Default: `null`

### <a name="input_cluster_preferred_maintenance_window"></a> [cluster\_preferred\_maintenance\_window](#input\_cluster\_preferred\_maintenance\_window)

Description: Weekly time range during which system maintenance can occur, in (UTC).

Type: `string`

Default: `null`

### <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot)

Description: Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier. Default is true.

Type: `bool`

Default: `true`

### <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate.

Type: `list(any)`

Default: `null`

### <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class)

Description: The instance type of the RDS cluster. Supported instance classes for database activity streams can be found at https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.Overview.html#DBActivityStreams.Overview.requirements.classes.

Type: `string`

Default: `"db.r5.large"`

### <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true.

Type: `bool`

Default: `true`

### <a name="input_instance_maintenance_schedule"></a> [instance\_maintenance\_schedule](#input\_instance\_maintenance\_schedule)

Description: Weekly time range during which system maintenance can occur, in (UTC).

Type: `string`

Default: `null`

### <a name="input_instance_minor_version_upgrade"></a> [instance\_minor\_version\_upgrade](#input\_instance\_minor\_version\_upgrade)

Description: Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window.

Type: `bool`

Default: `null`

### <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible)

Description: If instance is publicly accessible. Default false

Type: `bool`

Default: `null`

### <a name="input_key_custom_master_key_spec"></a> [key\_custom\_master\_key\_spec](#input\_key\_custom\_master\_key\_spec)

Description: Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, HMAC\_256, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1.

Type: `string`

Default: `"SYMMETRIC_DEFAULT"`

### <a name="input_key_deletion_window_in_days"></a> [key\_deletion\_window\_in\_days](#input\_key\_deletion\_window\_in\_days)

Description: The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive.

Type: `number`

Default: `30`

### <a name="input_key_description"></a> [key\_description](#input\_key\_description)

Description: The description of the key as viewed in AWS console.

Type: `string`

Default: `"AWS KMS Key to encrypt Aurora MySQL Database Activity Stream."`

### <a name="input_key_is_enabled"></a> [key\_is\_enabled](#input\_key\_is\_enabled)

Description: Specifies whether the key is enabled.

Type: `bool`

Default: `true`

### <a name="input_key_multi_region"></a> [key\_multi\_region](#input\_key\_multi\_region)

Description:  Indicates whether the KMS key is a multi-Region (true) or regional (false) key.

Type: `bool`

Default: `false`

### <a name="input_key_tags"></a> [key\_tags](#input\_key\_tags)

Description: A map of tags to assign to the object.

Type: `map(string)`

Default: `null`

### <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage)

Description: Specifies the intended use of the key. Valid values: ENCRYPT\_DECRYPT, SIGN\_VERIFY, GENERATE\_VERIFY\_MAC.

Type: `string`

Default: `"ENCRYPT_DECRYPT"`

### <a name="input_stream_mode"></a> [stream\_mode](#input\_stream\_mode)

Description: Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async.

Type: `string`

Default: `"async"`

## Outputs

The following outputs are exported:

### <a name="output_activity_stream"></a> [activity\_stream](#output\_activity\_stream)

Description: Aurora MySQL kinesis activity stream

### <a name="output_aws_kinesis_asset"></a> [aws\_kinesis\_asset](#output\_aws\_kinesis\_asset)

Description: AWS Kinesis stream asset

### <a name="output_aws_rds_aurora_mysql_cluster_asset"></a> [aws\_rds\_aurora\_mysql\_cluster\_asset](#output\_aws\_rds\_aurora\_mysql\_cluster\_asset)

Description: Aurora MySQL cluster asset

### <a name="output_cluster"></a> [cluster](#output\_cluster)

Description: Aurora MySQL Cluster

### <a name="output_instance"></a> [instance](#output\_instance)

Description: Aurora MySQL Cluster instance

### <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key)

Description: AWS KMS Key
<!-- END_TF_DOCS -->