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

- [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_arn"></a> [arn](#input\_arn)

Description: The Amazon Resource Name (ARN) of the target.

Type: `string`

### <a name="input_rule"></a> [rule](#input\_rule)

Description: The name of the rule you want to add targets to.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn)

Description: The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: EventBridge target
<!-- END_TF_DOCS -->