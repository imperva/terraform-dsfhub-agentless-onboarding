# onboard-aws-rds-aurora-postgresql
Onboard Amazon Aurora PostgreSQL to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from CloudWatch log groups.
2. A method to create the 'pgaudit' extension and 'rds_pgaudit' role on the postgres instance.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_aurora-postgresql-cluster"></a> [aurora-postgresql-cluster](#module\_aurora-postgresql-cluster)

Source: ../aws-rds-cluster

Version:

### <a name="module_aurora-postgresql-cluster-parameter-group"></a> [aurora-postgresql-cluster-parameter-group](#module\_aurora-postgresql-cluster-parameter-group)

Source: ../aws-rds-cluster-parameter-group

Version:

### <a name="module_aurora-postgresql-instance"></a> [aurora-postgresql-instance](#module\_aurora-postgresql-instance)

Source: ../aws-rds-cluster-instance

Version:

### <a name="module_aurora-postgresql-log-group"></a> [aurora-postgresql-log-group](#module\_aurora-postgresql-log-group)

Source: ../aws-cloudwatch-log-group

Version:

### <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset)

Source: ../dsfhub-aws-log-group

Version:

### <a name="module_aws-rds-aurora-postgresql-cluster-asset"></a> [aws-rds-aurora-postgresql-cluster-asset](#module\_aws-rds-aurora-postgresql-cluster-asset)

Source: ../dsfhub-aws-rds-aurora-postgresql-cluster

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_aws_aurora_postgresql_cluster_admin_email"></a> [aws\_aurora\_postgresql\_cluster\_admin\_email](#input\_aws\_aurora\_postgresql\_cluster\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_aurora_postgresql_cluster_gateway_id"></a> [aws\_aurora\_postgresql\_cluster\_gateway\_id](#input\_aws\_aurora\_postgresql\_cluster\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_aurora_postgresql_cluster_parent_asset_id"></a> [aws\_aurora\_postgresql\_cluster\_parent\_asset\_id](#input\_aws\_aurora\_postgresql\_cluster\_parent\_asset\_id)

Description: The asset\_id of the cloud account with auth-mech such as key-pair, iam-role etc.

Type: `string`

### <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id)

Description: The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'.

Type: `string`

### <a name="input_aws_log_group_region"></a> [aws\_log\_group\_region](#input\_aws\_log\_group\_region)

Description: AWS region of the log group

Type: `string`

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: The name of the RDS cluster

Type: `string`

### <a name="input_cluster_master_password"></a> [cluster\_master\_password](#input\_cluster\_master\_password)

Description: Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.

Type: `string`

### <a name="input_cluster_master_username"></a> [cluster\_master\_username](#input\_cluster\_master\_username)

Description: Username for the master DB user.

Type: `string`

### <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name)

Description: The name of the DB cluster parameter group

Type: `string`

### <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier)

Description: The name of the Aurora PostgreSQL cluster instance

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_aurora_postgresql_cluster_audit_type"></a> [aws\_aurora\_postgresql\_cluster\_audit\_type](#input\_aws\_aurora\_postgresql\_cluster\_audit\_type)

Description: Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details

Type: `string`

Default: `"LOG_GROUP"`

### <a name="input_aws_aurora_postgresql_cluster_region"></a> [aws\_aurora\_postgresql\_cluster\_region](#input\_aws\_aurora\_postgresql\_cluster\_region)

Description: AWS region containing the cluster.

Type: `string`

Default: `null`

### <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_aws_log_group_reason"></a> [aws\_log\_group\_reason](#input\_aws\_log\_group\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `null`

### <a name="input_cluster_backup_retention_period"></a> [cluster\_backup\_retention\_period](#input\_cluster\_backup\_retention\_period)

Description: Days to retain backups for.

Type: `number`

Default: `null`

### <a name="input_cluster_db_subnet_group_name"></a> [cluster\_db\_subnet\_group\_name](#input\_cluster\_db\_subnet\_group\_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

Default: `null`

### <a name="input_cluster_enabled_cloudwatch_logs_exports"></a> [cluster\_enabled\_cloudwatch\_logs\_exports](#input\_cluster\_enabled\_cloudwatch\_logs\_exports)

Description: Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery.

Type: `list(any)`

Default:

```json
[
  "postgresql"
]
```

### <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version)

Description: Database engine version, e.g., 16.1

Type: `string`

Default: `"16.1"`

### <a name="input_cluster_network_type"></a> [cluster\_network\_type](#input\_cluster\_network\_type)

Description:  Network type of the cluster. Valid values: IPV4, DUAL

Type: `string`

Default: `null`

### <a name="input_cluster_parameter_group_description"></a> [cluster\_parameter\_group\_description](#input\_cluster\_parameter\_group\_description)

Description: The description of the DB cluster parameter group.

Type: `string`

Default: `null`

### <a name="input_cluster_parameter_group_family"></a> [cluster\_parameter\_group\_family](#input\_cluster\_parameter\_group\_family)

Description: The family of the DB cluster parameter group.

Type: `string`

Default: `"aurora-postgresql16"`

### <a name="input_cluster_parameter_group_parameters"></a> [cluster\_parameter\_group\_parameters](#input\_cluster\_parameter\_group\_parameters)

Description: List of objects containing parameters for the DB cluster parameter group.

Type:

```hcl
list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
```

Default:

```json
[
  {
    "name": "log_connections",
    "value": 1
  },
  {
    "name": "log_disconnections",
    "value": 1
  },
  {
    "name": "log_error_verbosity",
    "value": "verbose"
  },
  {
    "name": "pgaudit.log",
    "value": "all"
  },
  {
    "name": "pgaudit.role",
    "value": "rds_pgaudit"
  },
  {
    "apply_method": "pending-reboot",
    "name": "shared_preload_libraries",
    "value": "pgaudit,pg_stat_statements"
  }
]
```

### <a name="input_cluster_parameter_group_tags"></a> [cluster\_parameter\_group\_tags](#input\_cluster\_parameter\_group\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

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

### <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `null`

### <a name="input_instance_db_instance_class"></a> [instance\_db\_instance\_class](#input\_instance\_db\_instance\_class)

Description: The instance type of the RDS cluster. Example: 'db.t3.micro'

Type: `string`

Default: `"db.t3.medium"`

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

### <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days)

Description: Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire.

Type: `number`

Default: `7`

## Outputs

The following outputs are exported:

### <a name="output_aws_log_group_asset"></a> [aws\_log\_group\_asset](#output\_aws\_log\_group\_asset)

Description: AWS log group asset

### <a name="output_aws_rds_aurora_postgresql_cluster_asset"></a> [aws\_rds\_aurora\_postgresql\_cluster\_asset](#output\_aws\_rds\_aurora\_postgresql\_cluster\_asset)

Description: Aurora PostgreSQL cluster asset

### <a name="output_cluster"></a> [cluster](#output\_cluster)

Description: Aurora PostgreSQL Cluster

### <a name="output_cluster_parameter_group"></a> [cluster\_parameter\_group](#output\_cluster\_parameter\_group)

Description: Aurora PostgreSQL Cluster parameter group

### <a name="output_instance"></a> [instance](#output\_instance)

Description: Aurora PostgreSQL instance

### <a name="output_log_group"></a> [log\_group](#output\_log\_group)

Description: Aurora PostgreSQL log group
<!-- END_TF_DOCS -->