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

- [aws_neptune_cluster_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster_parameter_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the Neptune cluster parameter group.

Type: `string`

### <a name="input_parameters"></a> [parameters](#input\_parameters)

Description: List of objects containing parameters for the Neptune cluster parameter group.

Type:

```hcl
list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_description"></a> [description](#input\_description)

Description: The description of the Neptune cluster parameter group.

Type: `string`

Default: `null`

### <a name="input_family"></a> [family](#input\_family)

Description: The family of the Neptune cluster parameter group.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Neptune cluster parameter group
<!-- END_TF_DOCS -->