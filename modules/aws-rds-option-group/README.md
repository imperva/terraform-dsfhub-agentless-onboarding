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

- [aws_db_option_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_option_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_engine_name"></a> [engine\_name](#input\_engine\_name)

Description: value

Type: `any`

### <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version)

Description: value

Type: `any`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the DB option group.

Type: `string`

### <a name="input_options"></a> [options](#input\_options)

Description: List of objects containing options for the DB option group.

Type:

```hcl
list(
    object({
      option_name = string
      option_settings = optional(
        list(
          object({
            name  = string
            value = string
          })
        ),
        null
      )
      port                           = optional(string, null)
      version                        = optional(string, null)
      db_security_group_memberships  = optional(list(string), null)
      vpc_security_group_memberships = optional(list(string), null)
    })
  )
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_description"></a> [description](#input\_description)

Description: The description of the DB option group.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: rds option group
<!-- END_TF_DOCS -->