# onboard-aws-dynamodb-s3
Onboard AWS DynamoDB via S3 to DSF Hub.

## Notes
The ``AWS DYNAMODB`` asset supports various authentication mechanisms (key, iam_role, profile, default) that can be used to authenticate to AWS and collect the audit logs from the S3 bucket. Ensure you have the necessary credentials/information for the chosen authentication mechanism, and that it has permissions to read from the newly created S3 bucket.

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

### <a name="module_aws-s3-asset"></a> [aws-s3-asset](#module\_aws-s3-asset)

Source: ../dsfhub-aws-s3-bucket-la

Version:

### <a name="module_dynamodb-cloudtrail"></a> [dynamodb-cloudtrail](#module\_dynamodb-cloudtrail)

Source: ../aws-cloudtrail

Version:

### <a name="module_eventbridge-firehose-iam-role"></a> [eventbridge-firehose-iam-role](#module\_eventbridge-firehose-iam-role)

Source: ../aws-iam-role

Version:

### <a name="module_eventbridge-rule"></a> [eventbridge-rule](#module\_eventbridge-rule)

Source: ../aws-cloudwatch-event-rule

Version:

### <a name="module_eventbridge-target"></a> [eventbridge-target](#module\_eventbridge-target)

Source: ../aws-cloudwatch-event-target

Version:

### <a name="module_firehose-s3-iam-role"></a> [firehose-s3-iam-role](#module\_firehose-s3-iam-role)

Source: ../aws-iam-role

Version:

### <a name="module_kinesis-firehose-delivery-stream"></a> [kinesis-firehose-delivery-stream](#module\_kinesis-firehose-delivery-stream)

Source: ../aws-kinesis-firehose-delivery-stream

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
- [aws_iam_policy_document.eventbridge_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.eventbridge_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.firehose_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.firehose_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
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

### <a name="input_aws_s3_admin_email"></a> [aws\_s3\_admin\_email](#input\_aws\_s3\_admin\_email)

Description: The email address to notify about this asset

Type: `string`

### <a name="input_aws_s3_gateway_id"></a> [aws\_s3\_gateway\_id](#input\_aws\_s3\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name)

Description: Name of the trail.

Type: `string`

### <a name="input_firehose_name"></a> [firehose\_name](#input\_firehose\_name)

Description: A name to identify the stream. This is unique to the AWS account and region the Stream is created in.

Type: `string`

### <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket)

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

Description: The name of a profile in /install\_dir/jsonar/local/credentials/.aws/credentials to use for authenticating

Type: `string`

Default: `null`

### <a name="input_aws_dynamodb_secret_key"></a> [aws\_dynamodb\_secret\_key](#input\_aws\_dynamodb\_secret\_key)

Description: AWS secret key. Required for "key" auth\_mechanism.

Type: `string`

Default: `null`

### <a name="input_aws_s3_audit_pull_enabled"></a> [aws\_s3\_audit\_pull\_enabled](#input\_aws\_s3\_audit\_pull\_enabled)

Description: Whether the DSFHUB should pull logs from the asset.

Type: `bool`

Default: `false`

### <a name="input_cloudtrail_enable_logging"></a> [cloudtrail\_enable\_logging](#input\_cloudtrail\_enable\_logging)

Description: Enables logging for the trail. Setting this to "false" will pause logging.

Type: `bool`

Default: `true`

### <a name="input_cloudtrail_event_selector"></a> [cloudtrail\_event\_selector](#input\_cloudtrail\_event\_selector)

Description: Specifies an event selector for enabling data event logging.

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

### <a name="input_eventbridge_iam_role_description"></a> [eventbridge\_iam\_role\_description](#input\_eventbridge\_iam\_role\_description)

Description: The description of the IAM role.

Type: `string`

Default: `"IAM role for sending DynamoDB logs from EventBridge to Firehose."`

### <a name="input_eventbridge_iam_role_name"></a> [eventbridge\_iam\_role\_name](#input\_eventbridge\_iam\_role\_name)

Description: Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource.

Type: `string`

Default: `"dynamodb_eventbridge_role"`

### <a name="input_eventbridge_iam_role_name_prefix"></a> [eventbridge\_iam\_role\_name\_prefix](#input\_eventbridge\_iam\_role\_name\_prefix)

Description: Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources.

Type: `string`

Default: `null`

### <a name="input_eventbridge_iam_role_tags"></a> [eventbridge\_iam\_role\_tags](#input\_eventbridge\_iam\_role\_tags)

Description: Key-value mapping of tags for the IAM role.

Type: `map(string)`

Default: `null`

### <a name="input_eventbridge_rule_description"></a> [eventbridge\_rule\_description](#input\_eventbridge\_rule\_description)

Description: The description of the rule.

Type: `string`

Default: `"Captures All DynamoDB events and sends to CloudWatch log group"`

### <a name="input_eventbridge_rule_event_pattern"></a> [eventbridge\_rule\_event\_pattern](#input\_eventbridge\_rule\_event\_pattern)

Description: The event pattern described a JSON object. See full documentation of [Events and Event Patterns in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html) for details.

Type: `any`

Default:

```json
{
  "detail": {
    "eventCategory": [
      "Management"
    ],
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

### <a name="input_firehose_iam_role_description"></a> [firehose\_iam\_role\_description](#input\_firehose\_iam\_role\_description)

Description: The description of the IAM role.

Type: `string`

Default: `"IAM role for sending DynamoDB logs from Firehose to S3."`

### <a name="input_firehose_iam_role_name"></a> [firehose\_iam\_role\_name](#input\_firehose\_iam\_role\_name)

Description: Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource.

Type: `string`

Default: `"dynamodb_firehose_role"`

### <a name="input_firehose_iam_role_name_prefix"></a> [firehose\_iam\_role\_name\_prefix](#input\_firehose\_iam\_role\_name\_prefix)

Description: Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources.

Type: `string`

Default: `null`

### <a name="input_firehose_iam_role_tags"></a> [firehose\_iam\_role\_tags](#input\_firehose\_iam\_role\_tags)

Description: Key-value mapping of tags for the IAM role.

Type: `map(string)`

Default: `null`

### <a name="input_firehose_tags"></a> [firehose\_tags](#input\_firehose\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_s3_bucket_prefix"></a> [s3\_bucket\_prefix](#input\_s3\_bucket\_prefix)

Description: Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length.

Type: `string`

Default: `null`

### <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy)

Description: A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy).

Type: `bool`

Default: `false`

### <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_aws-dynamodb-asset"></a> [aws-dynamodb-asset](#output\_aws-dynamodb-asset)

Description: AWS DynamoDB asset

### <a name="output_aws-s3-bucket-asset"></a> [aws-s3-bucket-asset](#output\_aws-s3-bucket-asset)

Description: AWS S3 asset

### <a name="output_dynamodb-cloudtrail"></a> [dynamodb-cloudtrail](#output\_dynamodb-cloudtrail)

Description: DynamoDB CloudTrail

### <a name="output_eventbridge-firehose-iam-role"></a> [eventbridge-firehose-iam-role](#output\_eventbridge-firehose-iam-role)

Description: EventBridge to firehose IAM role

### <a name="output_eventbridge-rule"></a> [eventbridge-rule](#output\_eventbridge-rule)

Description: EventBridge rule

### <a name="output_eventbridge-target"></a> [eventbridge-target](#output\_eventbridge-target)

Description: EventBridge target

### <a name="output_firehose-s3-iam-role"></a> [firehose-s3-iam-role](#output\_firehose-s3-iam-role)

Description: Firehose to S3 IAM role

### <a name="output_kinesis-firehose-delivery-stream"></a> [kinesis-firehose-delivery-stream](#output\_kinesis-firehose-delivery-stream)

Description: Firehose delivery stream to S3

### <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket)

Description: S3 bucket

### <a name="output_s3-bucket-policy"></a> [s3-bucket-policy](#output\_s3-bucket-policy)

Description: S3 bucket policy
<!-- END_TF_DOCS -->