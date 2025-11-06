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
| [aws_cloudtrail.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_watch_logs_group_arn"></a> [cloud\_watch\_logs\_group\_arn](#input\_cloud\_watch\_logs\_group\_arn) | The ARN of the CloudWatch log group to which CloudTrail logs will be delivered. | `string` | `null` | no |
| <a name="input_cloud_watch_logs_role_arn"></a> [cloud\_watch\_logs\_role\_arn](#input\_cloud\_watch\_logs\_role\_arn) | The ARN of the IAM role that CloudTrail assumes to write to the CloudWatch log group. | `string` | `null` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enables logging for the trail. Setting this to "false" will pause logging. | `bool` | `true` | no |
| <a name="input_event_selector"></a> [event\_selector](#input\_event\_selector) | Specifies an event selector for enabling data event logging. | <pre>list(<br>    object(<br>      {<br>        data_resource = optional(<br>          object(<br>            {<br>              type   = string<br>              values = list(string)<br>            }<br>          )<br>        )<br>        exclude_management_event_sources = optional(list(string))<br>        include_management_events        = optional(bool)<br>        read_write_type                  = optional(string)<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_include_global_service_events"></a> [include\_global\_service\_events](#input\_include\_global\_service\_events) | Whether the trail is publishing events from global services such as IAM to the log files. | `bool` | `true` | no |
| <a name="input_is_multi_region_trail"></a> [is\_multi\_region\_trail](#input\_is\_multi\_region\_trail) | Whether the trail is created in the current region or in all regions. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the trail. | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of the S3 bucket designated for publishing log files. | `string` | n/a | yes |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | The S3 key prefix that follows the name of the bucket you have designated for log file delivery. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS CloudTrail trail |
<!-- END_TF_DOCS -->