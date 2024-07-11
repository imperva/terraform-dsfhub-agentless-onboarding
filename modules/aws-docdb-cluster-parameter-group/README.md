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
| [aws_docdb_cluster_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the DocumentDB cluster parameter group. | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | Database family version, e.g. "docdb5.0" | `string` | `"docdb5.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the DocumentDB cluster parameter group. | `string` | `"docdb-parameter-group"` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | List of objects containing parameters for the DocumentDB parameter group. | <pre>list(<br>    object({<br>      name         = string<br>      apply_method = optional(string, "immediate")<br>      value        = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "apply_method": "immediate",<br>    "name": "audit_logs",<br>    "value": "all"<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the cluster. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS DocumentDB Parameter Group |
<!-- END_TF_DOCS -->