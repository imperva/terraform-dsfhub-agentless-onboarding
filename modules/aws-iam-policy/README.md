<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the policy. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | The policy document. This is a JSON formatted string. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the IAM policy. | `string` | `"Managed by Terraform"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with 'name'. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | Path in which to create the policy. Default: '/' | `string` | `"/"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the policy. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS IAM Policy |
<!-- END_TF_DOCS -->