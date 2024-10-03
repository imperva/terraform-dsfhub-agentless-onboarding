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

- [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy)

Description: The policy that grants an entity permission to assume the role.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_description"></a> [description](#input\_description)

Description: The description of the IAM role.

Type: `string`

Default: `null`

### <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies)

Description: Specifies whether to force detaching any policies the role has before destroying it. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_inline_policy"></a> [inline\_policy](#input\_inline\_policy)

Description: Configuration block defining an exclusive set of IAM inline policies associated with the IAM role.

Type:

```hcl
list(
    object(
      {
        name   = string
        policy = any
      }
    )
  )
```

Default: `null`

### <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns)

Description: Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies.

Type: `list(string)`

Default: `null`

### <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration)

Description: The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.

Type: `number`

Default: `3600`

### <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix)

Description: Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources.

Type: `string`

Default: `null`

### <a name="input_path"></a> [path](#input\_path)

Description: The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide.

Type: `string`

Default: `"/"`

### <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary)

Description: The ARN of the policy that is used to set the permissions boundary for the role.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key-value mapping of tags for the IAM role.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS IAM Role
<!-- END_TF_DOCS -->