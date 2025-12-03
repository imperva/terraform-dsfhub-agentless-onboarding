# onboard-aws-dynamodb-cloudwatch
Onboard AWS DynamoDB via CloudWatch to DSF Hub.

## Notes
The ``AWS DYNAMODB`` asset supports various authentication mechanisms (key, iam_role, profile, default) that can be used to authenticate to AWS and collect the audit logs from the CloudWatch log group. Ensure you have the necessary credentials/information for the chosen authentication mechanism, and that it has permissions to read from the newly created CloudWatch log group.

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
| <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset) | ../dsfhub-aws-log-group | n/a |
| <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail) | ../aws-cloudtrail | n/a |
| <a name="module_cloudwatch-policy"></a> [cloudwatch-policy](#module\_cloudwatch-policy) | ../aws-cloudwatch-log-resource-policy | n/a |
| <a name="module_dynamodb-log-group"></a> [dynamodb-log-group](#module\_dynamodb-log-group) | ../aws-cloudwatch-log-group | n/a |
| <a name="module_eventbridge-rule"></a> [eventbridge-rule](#module\_eventbridge-rule) | ../aws-cloudwatch-event-rule | n/a |
| <a name="module_eventbridge-target"></a> [eventbridge-target](#module\_eventbridge-target) | ../aws-cloudwatch-event-target | n/a |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | ../aws-s3-bucket | n/a |
| <a name="module_s3-bucket-policy"></a> [s3-bucket-policy](#module\_s3-bucket-policy) | ../aws-s3-bucket-policy | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudtrail_to_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eventbridge_to_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
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
| <a name="input_aws_dynamodb_profile_name"></a> [aws\_dynamodb\_profile\_name](#input\_aws\_dynamodb\_profile\_name) | The name of a profile in /path/to/JSONAR\_LOCALDIR/credentials/.aws/credentials to use for authentication. Required for "profile" auth\_mechanism. | `string` | `null` | no |
| <a name="input_aws_dynamodb_secret_key"></a> [aws\_dynamodb\_secret\_key](#input\_aws\_dynamodb\_secret\_key) | AWS secret key. Required for "key" auth\_mechanism. | `string` | `null` | no |
| <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id) | The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'. | `string` | n/a | yes |
| <a name="input_aws_log_group_reason"></a> [aws\_log\_group\_reason](#input\_aws\_log\_group\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_cloudtrail_enable_logging"></a> [cloudtrail\_enable\_logging](#input\_cloudtrail\_enable\_logging) | Enables logging for the trail. Setting this to "false" will pause logging. | `bool` | `true` | no |
| <a name="input_cloudtrail_event_selector"></a> [cloudtrail\_event\_selector](#input\_cloudtrail\_event\_selector) | Specifies an event selector for enabling data event logging. Note: exclude\_management\_event\_sources requires include\_management\_events set to true. If include\_management\_events is set to false, do not pass in exclude\_management\_event\_sources. | <pre>list(<br>    object(<br>      {<br>        data_resource = optional(<br>          object(<br>            {<br>              type   = string<br>              values = list(string)<br>            }<br>          )<br>        )<br>        exclude_management_event_sources = optional(list(string))<br>        include_management_events        = optional(bool)<br>        read_write_type                  = optional(string)<br>      }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "data_resource": {<br>      "type": "AWS::DynamoDB::Table",<br>      "values": [<br>        "arn:aws:dynamodb"<br>      ]<br>    },<br>    "exclude_management_event_sources": [<br>      "kms.amazonaws.com",<br>      "rdsdata.amazonaws.com"<br>    ],<br>    "include_management_events": true,<br>    "read_write_type": "All"<br>  }<br>]</pre> | no |
| <a name="input_cloudtrail_is_multi_region_trail"></a> [cloudtrail\_is\_multi\_region\_trail](#input\_cloudtrail\_is\_multi\_region\_trail) | Whether the trail is created in the current region or in all regions. | `bool` | `false` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | Name of the trail. | `string` | n/a | yes |
| <a name="input_cloudwatch_policy_policy_name"></a> [cloudwatch\_policy\_policy\_name](#input\_cloudwatch\_policy\_policy\_name) | Name of the resource policy. | `string` | `"eventbridge-to-cloudwatch-policy"` | no |
| <a name="input_eventbridge_rule_description"></a> [eventbridge\_rule\_description](#input\_eventbridge\_rule\_description) | The description of the EventBridge rule. | `string` | `"Captures All DynamoDB events and sends to CloudWatch log group"` | no |
| <a name="input_eventbridge_rule_event_pattern"></a> [eventbridge\_rule\_event\_pattern](#input\_eventbridge\_rule\_event\_pattern) | The event pattern described a JSON object. See full documentation of [Events and Event Patterns in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html) for details. | `any` | <pre>{<br>  "detail": {<br>    "eventSource": [<br>      "dynamodb.amazonaws.com"<br>    ],<br>    "sourceIPAddress": [<br>      {<br>        "anything-but": [<br>          "replication.dynamodb.amazonaws.com",<br>          "dynamodb.application-autoscaling.amazonaws.com",<br>          "application-autoscaling.amazonaws.com"<br>        ]<br>      }<br>    ]<br>  },<br>  "source": [<br>    "aws.dynamodb"<br>  ]<br>}</pre> | no |
| <a name="input_eventbridge_rule_name"></a> [eventbridge\_rule\_name](#input\_eventbridge\_rule\_name) | The name of the rule. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_eventbridge_rule_state"></a> [eventbridge\_rule\_state](#input\_eventbridge\_rule\_state) | State of the rule. Valid values are DISABLED, ENABLED, and ENABLED\_WITH\_ALL\_CLOUDTRAIL\_MANAGEMENT\_EVENTS. | `string` | `"ENABLED"` | no |
| <a name="input_eventbridge_rule_tags"></a> [eventbridge\_rule\_tags](#input\_eventbridge\_rule\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Name of AWS CloudWatch log group to contain DynamoDB logs. Will be prefixed with "/aws/events". | `string` | n/a | yes |
| <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire. | `number` | `7` | no |
| <a name="input_s3_bucket_force_destroy"></a> [s3\_bucket\_force\_destroy](#input\_s3\_bucket\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy). | `bool` | `false` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | The name of the bucket. Must be lowercase and less than or equal to 63 characters in length. | `string` | n/a | yes |
| <a name="input_s3_bucket_tags"></a> [s3\_bucket\_tags](#input\_s3\_bucket\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws-dynamodb-asset"></a> [aws-dynamodb-asset](#output\_aws-dynamodb-asset) | AWS DynamoDB asset |
| <a name="output_aws-log-group-asset"></a> [aws-log-group-asset](#output\_aws-log-group-asset) | AWS Log Group asset |
| <a name="output_cloudtrail"></a> [cloudtrail](#output\_cloudtrail) | AWS CloudTrail |
| <a name="output_cloudwatch-policy"></a> [cloudwatch-policy](#output\_cloudwatch-policy) | CloudWatch policy |
| <a name="output_eventbridge-rule"></a> [eventbridge-rule](#output\_eventbridge-rule) | EventBridge rule |
| <a name="output_eventbridge-target"></a> [eventbridge-target](#output\_eventbridge-target) | EventBridge target |
| <a name="output_log-group"></a> [log-group](#output\_log-group) | CloudWatch log group |
| <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket) | S3 bucket |
| <a name="output_s3-bucket-policy"></a> [s3-bucket-policy](#output\_s3-bucket-policy) | S3 bucket policy |
<!-- END_TF_DOCS -->