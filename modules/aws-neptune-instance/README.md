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

- [aws_neptune_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster_instance) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_identifier"></a> [identifier](#input\_identifier)

Description: The identifier for the neptune instance.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately)

Description: Specifies whether any instance modifications are applied immediately, or during the next maintenance window.

Type: `bool`

Default: `null`

### <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade)

Description: Indicates that minor engine upgrades will be applied automatically to the instance during the maintenance window.

Type: `bool`

Default: `null`

### <a name="input_class"></a> [class](#input\_class)

Description: The instance class to use.

Type: `string`

Default: `null`

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: The identifier of the aws\_neptune\_cluster in which to launch this instance.

Type: `string`

Default: `null`

### <a name="input_neptune_parameter_group_name"></a> [neptune\_parameter\_group\_name](#input\_neptune\_parameter\_group\_name)

Description: The name of the neptune parameter group to associate with this instance

Type: `string`

Default: `null`

### <a name="input_neptune_subnet_group_name"></a> [neptune\_subnet\_group\_name](#input\_neptune\_subnet\_group\_name)

Description: A subnet group to associate with this neptune instance. NOTE: This must match the neptune\_subnet\_group\_name of the attached aws\_neptune\_cluster

Type: `string`

Default: `null`

### <a name="input_port"></a> [port](#input\_port)

Description: The port on which the DB accepts connections.

Type: `number`

Default: `null`

### <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible)

Description: Bool to control if instance is publicly accessible.

Type: `bool`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS Neptune cluster instance
<!-- END_TF_DOCS -->