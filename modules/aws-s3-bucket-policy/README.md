<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Name of the bucket to which to apply the policy. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Text of the policy. Although this is a bucket policy rather than an IAM policy, the aws\_iam\_policy\_document data source may be used, so long as it specifies a principal. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS S3 bucket policy |
<!-- END_TF_DOCS -->