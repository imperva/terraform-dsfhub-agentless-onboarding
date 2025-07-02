# onboard-aws-dynamodb-s3
Onboard AWS DynamoDB via S3 to DSF Hub.

## Notes
The ``AWS DYNAMODB`` asset supports various authentication mechanisms (key, iam_role, profile, default) that can be used to authenticate to AWS and collect the audit logs from the S3 bucket. Ensure you have the necessary credentials/information for the chosen authentication mechanism, and that it has permissions to read from the newly created S3 bucket.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-dynamodb-asset"></a> [aws-dynamodb-asset](#module\_aws-dynamodb-asset) | ../dsfhub-aws-dynamodb | n/a |
| <a name="module_aws-s3-asset"></a> [aws-s3-asset](#module\_aws-s3-asset) | ../dsfhub-aws-s3-bucket-la | n/a |
| <a name="module_dynamodb-cloudtrail"></a> [dynamodb-cloudtrail](#module\_dynamodb-cloudtrail) | ../aws-cloudtrail | n/a |
| <a name="module_eventbridge-firehose-iam-role"></a> [eventbridge-firehose-iam-role](#module\_eventbridge-firehose-iam-role) | ../aws-iam-role | n/a |
| <a name="module_eventbridge-firehose-iam-role-policy"></a> [eventbridge-firehose-iam-role-policy](#module\_eventbridge-firehose-iam-role-policy) | ../aws-iam-role-policy | n/a |
| <a name="module_eventbridge-rule"></a> [eventbridge-rule](#module\_eventbridge-rule) | ../aws-cloudwatch-event-rule | n/a |
| <a name="module_eventbridge-target"></a> [eventbridge-target](#module\_eventbridge-target) | ../aws-cloudwatch-event-target | n/a |
| <a name="module_firehose-s3-iam-role"></a> [firehose-s3-iam-role](#module\_firehose-s3-iam-role) | ../aws-iam-role | n/a |
| <a name="module_firehose-s3-iam-role-policy"></a> [firehose-s3-iam-role-policy](#module\_firehose-s3-iam-role-policy) | ../aws-iam-role-policy | n/a |
| <a name="module_kinesis-firehose-delivery-stream"></a> [kinesis-firehose-delivery-stream](#module\_kinesis-firehose-delivery-stream) | ../aws-kinesis-firehose-delivery-stream | n/a |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | ../aws-s3-bucket | n/a |
| <a name="module_s3-bucket-policy"></a> [s3-bucket-policy](#module\_s3-bucket-policy) | ../aws-s3-bucket-policy | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudtrail_to_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eventbridge_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eventbridge_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_dynamodb_access_id"></a> [aws\_dynamodb\_access\_id](#input\_aws\_dynamodb\_access\_id) | AWS Access ID. Required for "key" auth\_mechanism. | `string` | `null` | no |
| <a name="input_aws_dynamodb_admin_email"></a> [aws\_dynamodb\_admin\_email](#input\_aws\_dynamodb\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_dynamodb_auth_mechanism"></a> [aws\_dynamodb\_auth\_mechanism](#input\_aws\_dynamodb\_auth\_mechanism) | Specifies the auth mechanism used by the connection for the db asset. Valid values: key, profile, default or iam\_role. | `string` | `"default"` | no |
| <a name="input_aws_dynamodb_gateway_id"></a> [aws\_dynamodb\_gateway\_id](#input\_aws\_dynamodb\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_aws_dynamodb_iam_role_name"></a> [aws\_dynamodb\_iam\_role\_name](#input\_aws\_dynamodb\_iam\_role\_name) | AWS arn of the IAM role to be assumed. Required for "iam\_role" auth\_mechanism. | `string` | `null` | no |
| <a name="input_aws_dynamodb_profile_name"></a> [aws\_dynamodb\_profile\_name](#input\_aws\_dynamodb\_profile\_name) | The name of a profile in /install\_dir/jsonar/local/credentials/.aws/credentials to use for authenticating | `string` | `null` | no |
| <a name="input_aws_dynamodb_secret_key"></a> [aws\_dynamodb\_secret\_key](#input\_aws\_dynamodb\_secret\_key) | AWS secret key. Required for "key" auth\_mechanism. | `string` | `null` | no |
| <a name="input_aws_s3_admin_email"></a> [aws\_s3\_admin\_email](#input\_aws\_s3\_admin\_email) | The email address to notify about this asset | `string` | n/a | yes |
| <a name="input_aws_s3_audit_pull_enabled"></a> [aws\_s3\_audit\_pull\_enabled](#input\_aws\_s3\_audit\_pull\_enabled) | Whether the DSFHUB should pull logs from the asset. | `bool` | `false` | no |
| <a name="input_aws_s3_gateway_id"></a> [aws\_s3\_gateway\_id](#input\_aws\_s3\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_cloudtrail_enable_logging"></a> [cloudtrail\_enable\_logging](#input\_cloudtrail\_enable\_logging) | Enables logging for the trail. Setting this to "false" will pause logging. | `bool` | `true` | no |
| <a name="input_cloudtrail_event_selector"></a> [cloudtrail\_event\_selector](#input\_cloudtrail\_event\_selector) | Specifies an event selector for enabling data event logging. | <pre>list(<br>    object(<br>      {<br>        data_resource = optional(<br>          object(<br>            {<br>              type   = string<br>              values = list(string)<br>            }<br>          )<br>        )<br>        exclude_management_event_sources = optional(list(string))<br>        include_management_events        = optional(bool)<br>        read_write_type                  = optional(string)<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "data_resource": {<br>      "type": "AWS::DynamoDB::Table",<br>      "values": [<br>        "arn:aws:dynamodb"<br>      ]<br>    },<br>    "exclude_management_event_sources": [<br>      "kms.amazonaws.com",<br>      "rdsdata.amazonaws.com"<br>    ],<br>    "include_management_events": true,<br>    "read_write_type": "All"<br>  }<br>]</pre> | no |
| <a name="input_cloudtrail_is_multi_region_trail"></a> [cloudtrail\_is\_multi\_region\_trail](#input\_cloudtrail\_is\_multi\_region\_trail) | Whether the trail is created in the current region or in all regions. | `bool` | `false` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | Name of the trail. | `string` | n/a | yes |
| <a name="input_eventbridge_iam_role_description"></a> [eventbridge\_iam\_role\_description](#input\_eventbridge\_iam\_role\_description) | The description of the IAM role. | `string` | `"IAM role for sending DynamoDB logs from EventBridge to Firehose."` | no |
| <a name="input_eventbridge_iam_role_name"></a> [eventbridge\_iam\_role\_name](#input\_eventbridge\_iam\_role\_name) | Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource. | `string` | `"dynamodb_eventbridge_role"` | no |
| <a name="input_eventbridge_iam_role_name_prefix"></a> [eventbridge\_iam\_role\_name\_prefix](#input\_eventbridge\_iam\_role\_name\_prefix) | Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources. | `string` | `null` | no |
| <a name="input_eventbridge_iam_role_tags"></a> [eventbridge\_iam\_role\_tags](#input\_eventbridge\_iam\_role\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `null` | no |
| <a name="input_eventbridge_rule_description"></a> [eventbridge\_rule\_description](#input\_eventbridge\_rule\_description) | The description of the rule. | `string` | `"Captures All DynamoDB events and sends to CloudWatch log group"` | no |
| <a name="input_eventbridge_rule_event_pattern"></a> [eventbridge\_rule\_event\_pattern](#input\_eventbridge\_rule\_event\_pattern) | The event pattern described a JSON object. See full documentation of [Events and Event Patterns in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html) for details. | `any` | <pre>{<br>  "detail": {<br>    "eventCategory": [<br>      "Management"<br>    ],<br>    "eventSource": [<br>      "dynamodb.amazonaws.com"<br>    ],<br>    "sourceIPAddress": [<br>      {<br>        "anything-but": [<br>          "replication.dynamodb.amazonaws.com",<br>          "dynamodb.application-autoscaling.amazonaws.com",<br>          "application-autoscaling.amazonaws.com"<br>        ]<br>      }<br>    ]<br>  },<br>  "source": [<br>    "aws.dynamodb"<br>  ]<br>}</pre> | no |
| <a name="input_eventbridge_rule_name"></a> [eventbridge\_rule\_name](#input\_eventbridge\_rule\_name) | The name of the rule. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_eventbridge_rule_state"></a> [eventbridge\_rule\_state](#input\_eventbridge\_rule\_state) | State of the rule. Valid values are DISABLED, ENABLED, and ENABLED\_WITH\_ALL\_CLOUDTRAIL\_MANAGEMENT\_EVENTS. | `string` | `"ENABLED"` | no |
| <a name="input_eventbridge_rule_tags"></a> [eventbridge\_rule\_tags](#input\_eventbridge\_rule\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_firehose_cloudwatch_logging_enabled"></a> [firehose\_cloudwatch\_logging\_enabled](#input\_firehose\_cloudwatch\_logging\_enabled) | Whether to enable CloudWatch logging for the Firehose delivery stream. Defaults to false. | `bool` | `false` | no |
| <a name="input_firehose_cloudwatch_logging_log_group_name"></a> [firehose\_cloudwatch\_logging\_log\_group\_name](#input\_firehose\_cloudwatch\_logging\_log\_group\_name) | The name of the CloudWatch log group to which Firehose will send logs. This value is required if enabled is true. | `string` | `null` | no |
| <a name="input_firehose_cloudwatch_logging_log_stream_name"></a> [firehose\_cloudwatch\_logging\_log\_stream\_name](#input\_firehose\_cloudwatch\_logging\_log\_stream\_name) | The name of the CloudWatch log stream to which Firehose will send logs. This value is required if enabled is true. | `string` | `null` | no |
| <a name="input_firehose_iam_role_description"></a> [firehose\_iam\_role\_description](#input\_firehose\_iam\_role\_description) | The description of the IAM role. | `string` | `"IAM role for sending DynamoDB logs from Firehose to S3."` | no |
| <a name="input_firehose_iam_role_name"></a> [firehose\_iam\_role\_name](#input\_firehose\_iam\_role\_name) | Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource. | `string` | `"dynamodb_firehose_role"` | no |
| <a name="input_firehose_iam_role_name_prefix"></a> [firehose\_iam\_role\_name\_prefix](#input\_firehose\_iam\_role\_name\_prefix) | Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources. | `string` | `null` | no |
| <a name="input_firehose_iam_role_tags"></a> [firehose\_iam\_role\_tags](#input\_firehose\_iam\_role\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `null` | no |
| <a name="input_firehose_name"></a> [firehose\_name](#input\_firehose\_name) | A name to identify the stream. This is unique to the AWS account and region the Stream is created in. | `string` | n/a | yes |
| <a name="input_firehose_tags"></a> [firehose\_tags](#input\_firehose\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The name of the bucket. Must be lowercase and less than or equal to 63 characters in length. | `string` | n/a | yes |
| <a name="input_s3_bucket_prefix"></a> [s3\_bucket\_prefix](#input\_s3\_bucket\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length. | `string` | `null` | no |
| <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy). | `bool` | `false` | no |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws-dynamodb-asset"></a> [aws-dynamodb-asset](#output\_aws-dynamodb-asset) | AWS DynamoDB asset |
| <a name="output_aws-s3-bucket-asset"></a> [aws-s3-bucket-asset](#output\_aws-s3-bucket-asset) | AWS S3 asset |
| <a name="output_dynamodb-cloudtrail"></a> [dynamodb-cloudtrail](#output\_dynamodb-cloudtrail) | DynamoDB CloudTrail |
| <a name="output_eventbridge-firehose-iam-role"></a> [eventbridge-firehose-iam-role](#output\_eventbridge-firehose-iam-role) | EventBridge to Firehose IAM role |
| <a name="output_eventbridge-firehose-iam-role-policy"></a> [eventbridge-firehose-iam-role-policy](#output\_eventbridge-firehose-iam-role-policy) | EventBridge to Firehose IAM role policy |
| <a name="output_eventbridge-rule"></a> [eventbridge-rule](#output\_eventbridge-rule) | EventBridge rule |
| <a name="output_eventbridge-target"></a> [eventbridge-target](#output\_eventbridge-target) | EventBridge target |
| <a name="output_firehose-s3-iam-role"></a> [firehose-s3-iam-role](#output\_firehose-s3-iam-role) | Firehose to S3 IAM role |
| <a name="output_firehose-s3-iam-role-policy"></a> [firehose-s3-iam-role-policy](#output\_firehose-s3-iam-role-policy) | Firehose to S3 IAM role policy |
| <a name="output_kinesis-firehose-delivery-stream"></a> [kinesis-firehose-delivery-stream](#output\_kinesis-firehose-delivery-stream) | Firehose delivery stream to S3 |
| <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket) | S3 bucket |
| <a name="output_s3-bucket-policy"></a> [s3-bucket-policy](#output\_s3-bucket-policy) | S3 bucket policy |
<!-- END_TF_DOCS -->