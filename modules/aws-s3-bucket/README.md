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

- [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_bucket"></a> [bucket](#input\_bucket)

Description: The name of the bucket. Must be lowercase and less than or equal to 63 characters in length.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix)

Description: Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length.

Type: `string`

Default: `null`

### <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy)

Description: A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy).

Type: `bool`

Default: `false`

### <a name="input_object_lock_enabled"></a> [object\_lock\_enabled](#input\_object\_lock\_enabled)

Description: A boolean that indicates whether this bucket should have an Object Lock configuration enabled.

Type: `bool`

Default: `false`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS S3 bucket
<!-- END_TF_DOCS -->