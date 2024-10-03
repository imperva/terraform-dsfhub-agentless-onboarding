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

- [aws_cloudtrail.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the trail.

Type: `string`

### <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name)

Description: Name of the S3 bucket designated for publishing log files.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging)

Description: Enables logging for the trail. Setting this to "false" will pause logging.

Type: `bool`

Default: `true`

### <a name="input_event_selector"></a> [event\_selector](#input\_event\_selector)

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

Default: `null`

### <a name="input_include_global_service_events"></a> [include\_global\_service\_events](#input\_include\_global\_service\_events)

Description: Whether the trail is publishing events from global services such as IAM to the log files.

Type: `bool`

Default: `true`

### <a name="input_is_multi_region_trail"></a> [is\_multi\_region\_trail](#input\_is\_multi\_region\_trail)

Description: Whether the trail is created in the current region or in all regions.

Type: `bool`

Default: `false`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS CloudTrail trail
<!-- END_TF_DOCS -->