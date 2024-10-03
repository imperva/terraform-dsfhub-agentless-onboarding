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

- [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of AWS CloudWatch log group

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days)

Description: Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire.

Type: `number`

Default: `7`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: aws cloudwatch log group
<!-- END_TF_DOCS -->