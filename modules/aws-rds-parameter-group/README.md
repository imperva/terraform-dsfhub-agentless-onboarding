<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the DB parameter group. | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the DB parameter group. | `string` | `null` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | List of objects containing parameters for the DB parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate") <br>      value        = any<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS RDS parameter group |
<!-- END_TF_DOCS -->