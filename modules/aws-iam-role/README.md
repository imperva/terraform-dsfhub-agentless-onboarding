<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | The policy that grants an entity permission to assume the role. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the IAM role. | `string` | `null` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Specifies whether to force detaching any policies the role has before destroying it. Defaults to false. | `bool` | `false` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. | `list(string)` | `null` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. | `number` | `3600` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide. | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the role. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS IAM Role |
<!-- END_TF_DOCS -->