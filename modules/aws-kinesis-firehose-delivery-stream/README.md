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

- [aws_kinesis_firehose_delivery_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_destination"></a> [destination](#input\_destination)

Description: This is the destination to where the data is delivered. Valid values: extended\_s3, redshift, elasticsearch, splunk, http\_endpoint, opensearch, opensearchserverless, snowflake.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: A name to identify the stream. This is unique to the AWS account and region the Stream is created in.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_extended_s3_configuration"></a> [extended\_s3\_configuration](#input\_extended\_s3\_configuration)

Description: Enhanced configuration options for the s3 destination.

Type:

```hcl
object(
    {
      bucket_arn          = optional(string)
      compression_format  = optional(string)
      error_output_prefix = optional(string)
      file_extension      = optional(string)
      prefix              = optional(string)
      role_arn            = optional(string)
      processing_configuration = optional(
        object(
          {
            enabled = string
            processors = optional(
              object(
                {
                  type = string
                }
              )
            )
          }
        )
      )
    }
  )
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Kinesis firehose delivery stream
<!-- END_TF_DOCS -->