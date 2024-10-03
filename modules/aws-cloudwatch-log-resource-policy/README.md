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

- [aws_cloudwatch_log_resource_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document)

Description: Details of the resource policy, including the identity of the principal that is enabled to put logs to this account. This is formatted as a JSON string. Maximum length of 5120 characters.

Type: `any`

### <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name)

Description: Name of the resource policy.

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: CloudWatch log resource policy.
<!-- END_TF_DOCS -->