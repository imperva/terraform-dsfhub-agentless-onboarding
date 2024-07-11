<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_redshift_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the Redshift parameter group. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the Redshift parameter group. | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the Redshift parameter group. | `string` | `"redshift-1.0"` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of Redshift parameters to apply. | <pre>list(<br>    object({<br>      name  = string<br>      value = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "name": "enable_user_activity_logging",<br>    "value": "true"<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS Redshift parameter group |
<!-- END_TF_DOCS -->