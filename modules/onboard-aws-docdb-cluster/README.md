# onboard-aws-docdb-cluster
Onboard Amazon DocumentDB to DSF Hub.

## Notes
There is one prerequisite for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from CloudWatch log groups.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_docdb-cluster"></a> [docdb-cluster](#module\_docdb-cluster)

Source: ../aws-docdb-cluster

Version:

### <a name="module_docdb-cluster-asset"></a> [docdb-cluster-asset](#module\_docdb-cluster-asset)

Source: ../dsfhub-aws-docdb-cluster

Version:

### <a name="module_docdb-cluster-instance"></a> [docdb-cluster-instance](#module\_docdb-cluster-instance)

Source: ../aws-docdb-cluster-instance

Version:

### <a name="module_docdb-log-group"></a> [docdb-log-group](#module\_docdb-log-group)

Source: ../aws-cloudwatch-log-group

Version:

### <a name="module_docdb-log-group-asset"></a> [docdb-log-group-asset](#module\_docdb-log-group-asset)

Source: ../dsfhub-aws-log-group

Version:

### <a name="module_docdb-param-group"></a> [docdb-param-group](#module\_docdb-param-group)

Source: ../aws-docdb-cluster-parameter-group

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_aws_docdb_cluster_admin_email"></a> [aws\_docdb\_cluster\_admin\_email](#input\_aws\_docdb\_cluster\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_aws_docdb_cluster_gateway_id"></a> [aws\_docdb\_cluster\_gateway\_id](#input\_aws\_docdb\_cluster\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_docdb_cluster_parent_asset_id"></a> [aws\_docdb\_cluster\_parent\_asset\_id](#input\_aws\_docdb\_cluster\_parent\_asset\_id)

Description: The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events)

Type: `string`

### <a name="input_aws_docdb_cluster_region"></a> [aws\_docdb\_cluster\_region](#input\_aws\_docdb\_cluster\_region)

Description: AWS region of the DocumentDB Cluster.

Type: `string`

### <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_log_group_region"></a> [aws\_log\_group\_region](#input\_aws\_log\_group\_region)

Description: AWS region of the log group

Type: `string`

### <a name="input_cluster_db_subnet_group_name"></a> [cluster\_db\_subnet\_group\_name](#input\_cluster\_db\_subnet\_group\_name)

Description: A DB subnet group to associate with this DB instance.

Type: `string`

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: Identifier of DocumentDB Cluster.

Type: `string`

### <a name="input_cluster_master_password"></a> [cluster\_master\_password](#input\_cluster\_master\_password)

Description: Password for the master DB user.

Type: `string`

### <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate with the Cluster

Type: `list(string)`

## Optional Inputs

The following input variables are optional (have default values):

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

Default: `true`

### <a name="input_cluster_deletion_protection"></a> [cluster\_deletion\_protection](#input\_cluster\_deletion\_protection)

Description: A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled.

Type: `bool`

Default: `false`

### <a name="input_cluster_enabled_cloudwatch_logs_exports"></a> [cluster\_enabled\_cloudwatch\_logs\_exports](#input\_cluster\_enabled\_cloudwatch\_logs\_exports)

Description: List of log types to export to CloudWatch.

Type: `list(string)`

Default:

```json
[
  "audit"
]
```

### <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version)

Description: Database engine version, e.g. "5.0.0"

Type: `string`

Default: `"5.0.0"`

### <a name="input_cluster_final_snapshot_identifier"></a> [cluster\_final\_snapshot\_identifier](#input\_cluster\_final\_snapshot\_identifier)

Description: The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made. Must be provided if skip\_final\_snapshot is set to false.

Type: `string`

Default: `null`

### <a name="input_cluster_master_username"></a> [cluster\_master\_username](#input\_cluster\_master\_username)

Description: Master DB username.

Type: `string`

Default: `"docdb"`

### <a name="input_cluster_port"></a> [cluster\_port](#input\_cluster\_port)

Description: The port on which the DB accepts connections.

Type: `number`

Default: `27017`

### <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot)

Description: Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final\_snapshot\_identifier

Type: `bool`

Default: `true`

### <a name="input_cluster_storage_type"></a> [cluster\_storage\_type](#input\_cluster\_storage\_type)

Description: The storage type to associate with the DB cluster.

Type: `string`

Default: `"standard"`

### <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags)

Description: A map of tags to assign to the DB cluster.

Type: `map(string)`

Default: `null`

### <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count)

Description: The number of instances to create in the DocumentDB cluster.

Type: `number`

Default: `1`

### <a name="input_instance_instance_class"></a> [instance\_instance\_class](#input\_instance\_instance\_class)

Description: The instance type of the DocumentDB cluster. Example: 'db.r5.large'. Reference: https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs

Type: `string`

Default: `"db.r5.large"`

### <a name="input_instance_promotion_tier"></a> [instance\_promotion\_tier](#input\_instance\_promotion\_tier)

Description: Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoted to a writer in case of failover.

Type: `number`

Default: `0`

### <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags)

Description: A map of tags to assign to the DocumentDB instance.

Type: `map(string)`

Default: `null`

### <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days)

Description: The number of days to retain log events.

Type: `number`

Default: `7`

### <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description)

Description: The description of the DocumentDB cluster parameter group.

Type: `string`

Default: `"Managed by Terraform"`

### <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family)

Description: Database family version, e.g. "docdb5.0"

Type: `string`

Default: `"docdb5.0"`

### <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name)

Description: The name of the DocumentDB cluster parameter group.

Type: `string`

Default: `"docdb-parameter-group"`

### <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters)

Description: List of objects containing parameters for the DocumentDB parameter group.

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
    "apply_method": "immediate",
    "name": "audit_logs",
    "value": "all"
  }
]
```

### <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags)

Description: A map of tags to assign to the cluster.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_docdb-cluster"></a> [docdb-cluster](#output\_docdb-cluster)

Description: docdb cluster

### <a name="output_docdb-cluster-asset"></a> [docdb-cluster-asset](#output\_docdb-cluster-asset)

Description: docdb cluster asset

### <a name="output_docdb-cluster-instance"></a> [docdb-cluster-instance](#output\_docdb-cluster-instance)

Description: docdb cluster instance

### <a name="output_docdb-log-group"></a> [docdb-log-group](#output\_docdb-log-group)

Description: docdb log group

### <a name="output_docdb-log-group-asset"></a> [docdb-log-group-asset](#output\_docdb-log-group-asset)

Description: docdb log group asset

### <a name="output_docdb-param-group"></a> [docdb-param-group](#output\_docdb-param-group)

Description: docdb parameter group
<!-- END_TF_DOCS -->