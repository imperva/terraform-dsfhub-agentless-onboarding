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

- [aws_docdb_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: Identifier of AWS DocumentDB Cluster.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately)

Description: Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `true`

### <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class)

Description: The instance type of the DocumentDB cluster. Example: 'db.r5.large'. Reference: https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs

Type: `string`

Default: `"db.r5.large"`

### <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count)

Description: The number of instances to create in the DocumentDB cluster.

Type: `number`

Default: `1`

### <a name="input_promotion_tier"></a> [promotion\_tier](#input\_promotion\_tier)

Description: Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoted to a writer in case of failover.

Type: `number`

Default: `0`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the DocumentDB instance.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS DocumentDB Cluster instance
<!-- END_TF_DOCS -->