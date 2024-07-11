<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_redshift_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_logging) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions. | `string` | n/a | yes |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Identifier of the source cluster. | `string` | n/a | yes |
| <a name="input_log_destination_type"></a> [log\_destination\_type](#input\_log\_destination\_type) | The log destination type. DSFHUB only supports s3 or null (audit via ODBC tables). Default is s3. | `string` | `"s3"` | no |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | The prefix applied to the log file names. Must be 'redshift' for DSFHUB. | `string` | `"redshift"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS Redshift Logging configuration |
<!-- END_TF_DOCS -->