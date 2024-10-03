<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_rds_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id)

Description: The name of the RDS cluster

Type: `string`

### <a name="input_identifier"></a> [identifier](#input\_identifier)

Description: The name of the aurora cluster instance

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `null`

### <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine)

Description: Cluster engine e.g., aurora-mysql

Type: `string`

Default: `null`

### <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class)

Description: The instance type of the RDS cluster. Example: 'db.t3.micro'

Type: `string`

Default: `null`

### <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available.

Type: `string`

Default: `null`

### <a name="input_maintenance_schedule"></a> [maintenance\_schedule](#input\_maintenance\_schedule)

Description: Weekly time range during which system maintenance can occur, in (UTC).

Type: `string`

Default: `null`

### <a name="input_minor_version_upgrade"></a> [minor\_version\_upgrade](#input\_minor\_version\_upgrade)

Description: Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window.

Type: `bool`

Default: `null`

### <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible)

Description: If instance is publicly accessible. Default false

Type: `bool`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: RDS Aurora cluster instance
<!-- END_TF_DOCS -->