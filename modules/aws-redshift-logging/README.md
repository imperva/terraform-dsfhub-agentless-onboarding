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

- [aws_redshift_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_logging) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name)

Description: The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions.

Type: `string`

### <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier)

Description: Identifier of the source cluster.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_log_destination_type"></a> [log\_destination\_type](#input\_log\_destination\_type)

Description: The log destination type. DSFHUB only supports s3 or null (audit via ODBC tables). Default is s3.

Type: `string`

Default: `"s3"`

### <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix)

Description: The prefix applied to the log file names. Must be 'redshift' for DSFHUB.

Type: `string`

Default: `"redshift"`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS Redshift Logging configuration
<!-- END_TF_DOCS -->