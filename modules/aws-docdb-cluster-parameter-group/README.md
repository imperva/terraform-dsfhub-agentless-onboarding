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

- [aws_docdb_cluster_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_parameter_group) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_description"></a> [description](#input\_description)

Description: The description of the DocumentDB cluster parameter group.

Type: `string`

Default: `null`

### <a name="input_family"></a> [family](#input\_family)

Description: Database family version, e.g. "docdb5.0"

Type: `string`

Default: `"docdb5.0"`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the DocumentDB cluster parameter group.

Type: `string`

Default: `"docdb-parameter-group"`

### <a name="input_parameters"></a> [parameters](#input\_parameters)

Description: List of objects containing parameters for the DocumentDB parameter group.

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

Default:

```json
[
  {
    "apply_method": "immediate",
    "name": "audit_logs",
    "value": "all"
  }
]
```

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the cluster.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS DocumentDB Parameter Group
<!-- END_TF_DOCS -->