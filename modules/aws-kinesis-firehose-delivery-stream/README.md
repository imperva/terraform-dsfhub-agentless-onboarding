<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_firehose_delivery_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination"></a> [destination](#input\_destination) | This is the destination to where the data is delivered. Valid values: extended\_s3, redshift, elasticsearch, splunk, http\_endpoint, opensearch, opensearchserverless, snowflake. | `string` | n/a | yes |
| <a name="input_extended_s3_configuration"></a> [extended\_s3\_configuration](#input\_extended\_s3\_configuration) | Enhanced configuration options for the s3 destination. | <pre>object(<br>    {<br>      bucket_arn          = optional(string)<br>      compression_format  = optional(string)<br>      error_output_prefix = optional(string)<br>      file_extension      = optional(string)<br>      prefix              = optional(string)<br>      role_arn            = optional(string)<br>      processing_configuration = optional(<br>        object(<br>          {<br>            enabled = string<br>            processors = optional(<br>              object(<br>                {<br>                  type = string<br>                }<br>              )<br>            )<br>          }<br>        )<br>      )<br>    }<br>  )</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name to identify the stream. This is unique to the AWS account and region the Stream is created in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Kinesis firehose delivery stream |
<!-- END_TF_DOCS -->