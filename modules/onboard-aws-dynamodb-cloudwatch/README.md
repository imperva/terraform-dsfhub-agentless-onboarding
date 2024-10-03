# onboard-aws-dynamodb-cloudwatch
Onboard AWS DynamoDB via CloudWatch to DSF Hub.

## Notes
The ``AWS DYNAMODB`` asset supports various authentication mechanisms (key, iam_role, profile, default) that can be used to authenticate to AWS and collect the audit logs from the CloudWatch log group. Ensure you have the necessary credentials/information for the chosen authentication mechanism, and that it has permissions to read from the newly created CloudWatch log group.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

The following Modules are called:

### <a name="module_aws-dynamodb-asset"></a> [aws-dynamodb-asset](#module\_aws-dynamodb-asset)

Source: ../dsfhub-aws-dynamodb

Version:

### <a name="module_aws-log-group-asset"></a> [aws-log-group-asset](#module\_aws-log-group-asset)

Source: ../dsfhub-aws-log-group

Version:

### <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail)

Source: ../aws-cloudtrail

Version:

### <a name="module_cloudwatch-policy"></a> [cloudwatch-policy](#module\_cloudwatch-policy)

Source: ../aws-cloudwatch-log-resource-policy

Version:

### <a name="module_dynamodb-log-group"></a> [dynamodb-log-group](#module\_dynamodb-log-group)

Source: ../aws-cloudwatch-log-group

Version:

### <a name="module_eventbridge-rule"></a> [eventbridge-rule](#module\_eventbridge-rule)

Source: ../aws-cloudwatch-event-rule

Version:

### <a name="module_eventbridge-target"></a> [eventbridge-target](#module\_eventbridge-target)

Source: ../aws-cloudwatch-event-target

Version:

### <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket)

Source: ../aws-s3-bucket

Version:

### <a name="module_s3-bucket-policy"></a> [s3-bucket-policy](#module\_s3-bucket-policy)

Source: ../aws-s3-bucket-policy

Version:

## Resources

The following resources are used by this module:

- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_iam_policy_document.cloudtrail_to_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.eventbridge_to_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) (data source)
- [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_aws_dynamodb_admin_email"></a> [aws\_dynamodb\_admin\_email](#input\_aws\_dynamodb\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_dynamodb_gateway_id"></a> [aws\_dynamodb\_gateway\_id](#input\_aws\_dynamodb\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_aws_log_group_admin_email"></a> [aws\_log\_group\_admin\_email](#input\_aws\_log\_group\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_aws_log_group_gateway_id"></a> [aws\_log\_group\_gateway\_id](#input\_aws\_log\_group\_gateway\_id)

Description: The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'.

Type: `string`

### <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name)

Description: Name of the trail.

Type: `string`

### <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name)

Description: Name of AWS CloudWatch log group to contain DynamoDB logs. Will be prefixed with "/aws/events".

Type: `string`

### <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name)

Description: The name of the bucket. Must be lowercase and less than or equal to 63 characters in length.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_dynamodb_access_id"></a> [aws\_dynamodb\_access\_id](#input\_aws\_dynamodb\_access\_id)

Description: AWS Access ID. Required for "key" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_aws_dynamodb_auth_mechanism"></a> [aws\_dynamodb\_auth\_mechanism](#input\_aws\_dynamodb\_auth\_mechanism)

Description: Specifies the auth mechanism used by the connection for the db asset. Valid values: key, profile, default or iam\_role.

Type: `string`

Default: `"default"`

### <a name="input_aws_dynamodb_iam_role_name"></a> [aws\_dynamodb\_iam\_role\_name](#input\_aws\_dynamodb\_iam\_role\_name)

Description: AWS arn of the IAM role to be assumed. Required for "iam\_role" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_aws_dynamodb_profile_name"></a> [aws\_dynamodb\_profile\_name](#input\_aws\_dynamodb\_profile\_name)

Description: The name of a profile in /install\_dir/jsonar/local/credentials/.aws/credentials to use for authentication. Required for "profile" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_aws_dynamodb_secret_key"></a> [aws\_dynamodb\_secret\_key](#input\_aws\_dynamodb\_secret\_key)

Description: AWS secret key. Required for "key" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_aws_log_group_audit_pull_enabled"></a> [aws\_log\_group\_audit\_pull\_enabled](#input\_aws\_log\_group\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_aws_log_group_reason"></a> [aws\_log\_group\_reason](#input\_aws\_log\_group\_reason)

Description: Used to differentiate connections that belong to the same asset

Type: `string`

Default: `"default"`

### <a name="input_cloudtrail_enable_logging"></a> [cloudtrail\_enable\_logging](#input\_cloudtrail\_enable\_logging)

Description: Enables logging for the trail. Setting this to "false" will pause logging.

Type: `bool`

Default: `true`

### <a name="input_cloudtrail_event_selector"></a> [cloudtrail\_event\_selector](#input\_cloudtrail\_event\_selector)

Description: Specifies an event selector for enabling data event logging. Note: exclude\_management\_event\_sources requires include\_management\_events set to true. If include\_management\_events is set to false, do not pass in exclude\_management\_event\_sources.

Type:

```hcl
list(
    object(
      {
        data_resource = optional(
          object(
            {
              type   = string
              values = list(string)
            }
          )
        )
        exclude_management_event_sources = optional(list(string))
        include_management_events        = optional(bool)
        read_write_type                  = optional(string)
      }
    )
  )
```

Default:

```json
[
  {
    "data_resource": {
      "type": "AWS::DynamoDB::Table",
      "values": [
        "arn:aws:dynamodb"
      ]
    },
    "exclude_management_event_sources": [
      "kms.amazonaws.com",
      "rdsdata.amazonaws.com"
    ],
    "include_management_events": true,
    "read_write_type": "All"
  }
]
```

### <a name="input_cloudtrail_is_multi_region_trail"></a> [cloudtrail\_is\_multi\_region\_trail](#input\_cloudtrail\_is\_multi\_region\_trail)

Description: Whether the trail is created in the current region or in all regions.

Type: `bool`

Default: `false`

### <a name="input_cloudwatch_policy_policy_name"></a> [cloudwatch\_policy\_policy\_name](#input\_cloudwatch\_policy\_policy\_name)

Description: Name of the resource policy.

Type: `string`

Default: `"eventbridge-to-cloudwatch-policy"`

### <a name="input_eventbridge_rule_description"></a> [eventbridge\_rule\_description](#input\_eventbridge\_rule\_description)

Description: The description of the EventBridge rule.

Type: `string`

Default: `"Captures All DynamoDB events and sends to CloudWatch log group"`

### <a name="input_eventbridge_rule_event_pattern"></a> [eventbridge\_rule\_event\_pattern](#input\_eventbridge\_rule\_event\_pattern)

Description: The event pattern described a JSON object. See full documentation of [Events and Event Patterns in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html) for details.

Type: `any`

Default:

```json
{
  "detail": {
    "eventSource": [
      "dynamodb.amazonaws.com"
    ],
    "sourceIPAddress": [
      {
        "anything-but": [
          "replication.dynamodb.amazonaws.com",
          "dynamodb.application-autoscaling.amazonaws.com",
          "application-autoscaling.amazonaws.com"
        ]
      }
    ]
  },
  "source": [
    "aws.dynamodb"
  ]
}
```

### <a name="input_eventbridge_rule_name"></a> [eventbridge\_rule\_name](#input\_eventbridge\_rule\_name)

Description: The name of the rule. If omitted, Terraform will assign a random, unique name.

Type: `string`

Default: `null`

### <a name="input_eventbridge_rule_state"></a> [eventbridge\_rule\_state](#input\_eventbridge\_rule\_state)

Description: State of the rule. Valid values are DISABLED, ENABLED, and ENABLED\_WITH\_ALL\_CLOUDTRAIL\_MANAGEMENT\_EVENTS.

Type: `string`

Default: `"ENABLED"`

### <a name="input_eventbridge_rule_tags"></a> [eventbridge\_rule\_tags](#input\_eventbridge\_rule\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_log_group_retention_in_days"></a> [log\_group\_retention\_in\_days](#input\_log\_group\_retention\_in\_days)

Description: Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire.

Type: `number`

Default: `7`

### <a name="input_s3_bucket_force_destroy"></a> [s3\_bucket\_force\_destroy](#input\_s3\_bucket\_force\_destroy)

Description: A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy).

Type: `bool`

Default: `false`

### <a name="input_s3_bucket_tags"></a> [s3\_bucket\_tags](#input\_s3\_bucket\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_aws-dynamodb-asset"></a> [aws-dynamodb-asset](#output\_aws-dynamodb-asset)

Description: AWS DynamoDB asset

### <a name="output_aws-log-group-asset"></a> [aws-log-group-asset](#output\_aws-log-group-asset)

Description: AWS Log Group asset

### <a name="output_cloudtrail"></a> [cloudtrail](#output\_cloudtrail)

Description: AWS CloudTrail

### <a name="output_cloudwatch-policy"></a> [cloudwatch-policy](#output\_cloudwatch-policy)

Description: CloudWatch policy

### <a name="output_eventbridge-rule"></a> [eventbridge-rule](#output\_eventbridge-rule)

Description: EventBridge rule

### <a name="output_eventbridge-target"></a> [eventbridge-target](#output\_eventbridge-target)

Description: EventBridge target

### <a name="output_log-group"></a> [log-group](#output\_log-group)

Description: CloudWatch log group

### <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket)

Description: S3 bucket

### <a name="output_s3-bucket-policy"></a> [s3-bucket-policy](#output\_s3-bucket-policy)

Description: S3 bucket policy
<!-- END_TF_DOCS -->