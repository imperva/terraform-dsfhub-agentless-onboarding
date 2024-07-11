<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_neptune_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The identifier for the neptune instance. | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any instance modifications are applied immediately, or during the next maintenance window. | `bool` | `null` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the instance during the maintenance window. Default is true | `bool` | `null` | no |
| <a name="input_class"></a> [class](#input\_class) | The instance class to use. | `string` | `null` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The identifier of the aws\_neptune\_cluster in which to launch this instance. | `string` | `null` | no |
| <a name="input_neptune_parameter_group_name"></a> [neptune\_parameter\_group\_name](#input\_neptune\_parameter\_group\_name) | The name of the neptune parameter group to associate with this instance | `string` | `null` | no |
| <a name="input_neptune_subnet_group_name"></a> [neptune\_subnet\_group\_name](#input\_neptune\_subnet\_group\_name) | A subnet group to associate with this neptune instance. NOTE: This must match the neptune\_subnet\_group\_name of the attached aws\_neptune\_cluster | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections. Defaults to 8182 | `number` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Bool to control if instance is publicly accessible. Default is false | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS Neptune cluster instance |
<!-- END_TF_DOCS -->