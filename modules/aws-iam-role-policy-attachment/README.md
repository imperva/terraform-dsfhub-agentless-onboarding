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

- [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn)

Description: The ARN of the IAM policy you want to apply.

Type: `string`

### <a name="input_role"></a> [role](#input\_role)

Description: The IAM role to attach the policy to.

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS IAM Role Policy Attachment
<!-- END_TF_DOCS -->