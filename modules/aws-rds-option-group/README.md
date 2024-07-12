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
| [aws_db_option_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_option_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the DB option group. | `string` | `null` | no |
| <a name="input_engine_name"></a> [engine\_name](#input\_engine\_name) | value | `any` | n/a | yes |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | value | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the DB option group. | `string` | n/a | yes |
| <a name="input_options"></a> [options](#input\_options) | List of objects containing options for the DB option group. | <pre>list(<br>    object({<br>      option_name = string<br>      option_settings = optional(<br>        list(<br>          object({<br>            name  = string<br>            value = string<br>          })<br>        ),<br>        null<br>      )<br>      port                           = optional(string, null)<br>      version                        = optional(string, null)<br>      db_security_group_memberships  = optional(list(string), null)<br>      vpc_security_group_memberships = optional(list(string), null)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | rds option group |
<!-- END_TF_DOCS -->