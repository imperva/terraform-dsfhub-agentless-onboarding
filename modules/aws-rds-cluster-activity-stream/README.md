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

- [aws_rds_cluster_activity_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_activity_stream) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id)

Description: The AWS KMS key identifier for encrypting messages in the database activity stream. The AWS KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key.

Type: `string`

### <a name="input_mode"></a> [mode](#input\_mode)

Description: Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. One of: sync, async.

Type: `string`

### <a name="input_resource_arn"></a> [resource\_arn](#input\_resource\_arn)

Description: The Amazon Resource Name (ARN) of the DB cluster

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_engine_native_audit_fields_included"></a> [engine\_native\_audit\_fields\_included](#input\_engine\_native\_audit\_fields\_included)

Description: Specifies whether the database activity stream includes engine-native audit fields. This option only applies to an Oracle DB instance. By default, no engine-native audit fields are included.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: RDS Aurora Cluster database activity stream
<!-- END_TF_DOCS -->