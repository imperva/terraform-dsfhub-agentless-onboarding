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

- [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the policy. If omitted, Terraform will assign a random, unique name.

Type: `string`

### <a name="input_policy"></a> [policy](#input\_policy)

Description: The policy document. This is a JSON formatted string.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_description"></a> [description](#input\_description)

Description: Description of the IAM policy.

Type: `string`

Default: `"Managed by Terraform"`

### <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix)

Description: Creates a unique name beginning with the specified prefix. Conflicts with 'name'.

Type: `string`

Default: `null`

### <a name="input_path"></a> [path](#input\_path)

Description: Path in which to create the policy. Default: '/'

Type: `string`

Default: `"/"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the policy.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS IAM Policy
<!-- END_TF_DOCS -->