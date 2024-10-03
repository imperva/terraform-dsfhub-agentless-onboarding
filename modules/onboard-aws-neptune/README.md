# onboard-aws-neptune
Onboard Amazon Neptune to DSF Hub.

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

### <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset)

Source: ../dsfhub-aws-log-group

Version:

### <a name="module_aws-neptune-cluster-asset"></a> [aws-neptune-cluster-asset](#module\_aws-neptune-cluster-asset)

Source: ../dsfhub-aws-neptune-cluster

Version:

### <a name="module_neptune-cluster"></a> [neptune-cluster](#module\_neptune-cluster)

Source: ../aws-neptune-cluster

Version:

### <a name="module_neptune-cluster-parameter-group"></a> [neptune-cluster-parameter-group](#module\_neptune-cluster-parameter-group)

Source: ../aws-neptune-cluster-parameter-group

Version:

### <a name="module_neptune-instance"></a> [neptune-instance](#module\_neptune-instance)

Source: ../aws-neptune-instance

Version:

### <a name="module_neptune-log-group"></a> [neptune-log-group](#module\_neptune-log-group)

Source: ../aws-cloudwatch-log-group

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_aws_neptune_cluster_admin_email"></a> [aws\_neptune\_cluster\_admin\_email](#input\_aws\_neptune\_cluster\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_neptune_cluster_gateway_id"></a> [aws\_neptune\_cluster\_gateway\_id](#input\_aws\_neptune\_cluster\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_neptune_cluster_parent_asset_id"></a> [aws\_neptune\_cluster\_parent\_asset\_id](#input\_aws\_neptune\_cluster\_parent\_asset\_id)

Description: The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default

Type: `string`

### <a name="input_aws_neptune_cluster_region"></a> [aws\_neptune\_cluster\_region](#input\_aws\_neptune\_cluster\_region)

Description: AWS region containing the instance.

Type: `string`

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: The cluster identifier

Type: `string`

### <a name="input_instance_identifier"></a> [instance\_identifier](#input\_instance\_identifier)

Description: The identifier for the neptune instance.

Type: `string`

### <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name)

Description: The name of the cluster parameter group.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_cluster_apply_immediately"></a> [cluster\_apply\_immediately](#input\_cluster\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_cluster_backup_retention_period"></a> [cluster\_backup\_retention\_period](#input\_cluster\_backup\_retention\_period)

Description: The days to retain backups for. Default is 1

Type: `number`

Default: `1`

### <a name="input_cluster_enable_cloudwatch_logs_exports"></a> [cluster\_enable\_cloudwatch\_logs\_exports](#input\_cluster\_enable\_cloudwatch\_logs\_exports)

Description: A list of the log types this DB cluster is configured to export to Cloudwatch Logs. Currently only supports audit and slowquery

Type: `list(string)`

Default:

```json
[
  "audit"
]
```

### <a name="input_cluster_engine"></a> [cluster\_engine](#input\_cluster\_engine)

Description: The name of the database engine to be used for this Neptune cluster.

Type: `string`

Default: `"neptune"`

### <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version)

Description: The database engine version.

Type: `string`

Default: `"1.3.2.0"`

### <a name="input_cluster_iam_database_authentication_enabled"></a> [cluster\_iam\_database\_authentication\_enabled](#input\_cluster\_iam\_database\_authentication\_enabled)

Description:  Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled.

Type: `bool`

Default: `true`

### <a name="input_cluster_preferred_maintenance_window"></a> [cluster\_preferred\_maintenance\_window](#input\_cluster\_preferred\_maintenance\_window)

Description: Weekly time range during which system maintenance can occur, in (UTC).

Type: `string`

Default: `"sun:18:00-sun:21:00"`

### <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot)

Description: Determines whether a final Neptune snapshot is created before the Neptune cluster is deleted. If true is specified, no Neptune snapshot is created. If false is specified, a Neptune snapshot is created before the Neptune cluster is deleted, using the value from final\_snapshot\_identifier

Type: `bool`

Default: `true`

### <a name="input_cluster_storage_type"></a> [cluster\_storage\_type](#input\_cluster\_storage\_type)

Description: Storage type associated with the cluster. Default: standard

Type: `string`

Default: `"standard"`

### <a name="input_cluster_vpc_security_group_ids"></a> [cluster\_vpc\_security\_group\_ids](#input\_cluster\_vpc\_security\_group\_ids)

Description: List of VPC security groups to associate with the Cluster

Type: `list(string)`

Default: `null`

### <a name="input_instance_apply_immediately"></a> [instance\_apply\_immediately](#input\_instance\_apply\_immediately)

Description: Specifies whether any instance modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_instance_auto_minor_version_upgrade"></a> [instance\_auto\_minor\_version\_upgrade](#input\_instance\_auto\_minor\_version\_upgrade)

Description: Indicates that minor engine upgrades will be applied automatically to the instance during the maintenance window. Default is false.

Type: `bool`

Default: `false`

### <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class)

Description: The instance class to use.

Type: `string`

Default: `"db.t3.medium"`

### <a name="input_instance_neptune_parameter_group_name"></a> [instance\_neptune\_parameter\_group\_name](#input\_instance\_neptune\_parameter\_group\_name)

Description: The name of the neptune parameter group to associate with this instance

Type: `string`

Default: `"default.neptune1"`

### <a name="input_instance_neptune_subnet_group_name"></a> [instance\_neptune\_subnet\_group\_name](#input\_instance\_neptune\_subnet\_group\_name)

Description: A subnet group to associate with this neptune instance. NOTE: This must match the neptune\_subnet\_group\_name of the attached aws\_neptune\_cluster

Type: `string`

Default: `null`

### <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port)

Description: The port on which the DB accepts connections. Defaults to 8182

Type: `number`

Default: `8182`

### <a name="input_instance_publicly_accessible"></a> [instance\_publicly\_accessible](#input\_instance\_publicly\_accessible)

Description: Bool to control if instance is publicly accessible. Default is false.

Type: `bool`

Default: `false`

### <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days)

Description: Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire.

Type: `number`

Default: `7`

### <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description)

Description: Neptune cluster parameter group

Type: `string`

Default: `"Neptune cluster parameter group"`

### <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family)

Description: The family of the cluster parameter group.

Type: `string`

Default: `"neptune1.3"`

### <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters)

Description: List of objects containing parameters for the cluster parameter group.

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
    "apply_method": "pending-reboot",
    "name": "neptune_enable_audit_log",
    "value": 1
  }
]
```

### <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_cluster"></a> [cluster](#output\_cluster)

Description: Neptune Cluster

### <a name="output_cluster_parameter_group"></a> [cluster\_parameter\_group](#output\_cluster\_parameter\_group)

Description: Neptune Cluster parameter group

### <a name="output_dsf_neptune_cluster"></a> [dsf\_neptune\_cluster](#output\_dsf\_neptune\_cluster)

Description: Neptune cluster DSF asset

### <a name="output_dsf_neptune_log_group"></a> [dsf\_neptune\_log\_group](#output\_dsf\_neptune\_log\_group)

Description: DSF neptune log group asset

### <a name="output_instance"></a> [instance](#output\_instance)

Description: Neptune instance

### <a name="output_log_group"></a> [log\_group](#output\_log\_group)

Description: Neptune log group
<!-- END_TF_DOCS -->