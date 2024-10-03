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

- [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_bucket"></a> [bucket](#input\_bucket)

Description: Name of the bucket to which to apply the policy.

Type: `string`

### <a name="input_policy"></a> [policy](#input\_policy)

Description: Text of the policy. Although this is a bucket policy rather than an IAM policy, the aws\_iam\_policy\_document data source may be used, so long as it specifies a principal.

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS S3 bucket policy
<!-- END_TF_DOCS -->