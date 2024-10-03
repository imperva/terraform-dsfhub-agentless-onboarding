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

- [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_description"></a> [description](#input\_description)

Description: The description of the rule.

Type: `string`

Default: `null`

### <a name="input_event_pattern"></a> [event\_pattern](#input\_event\_pattern)

Description: The event pattern described a JSON object. See full documentation of [Events and Event Patterns in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html) for details.

Type: `any`

Default: `null`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the rule. If omitted, Terraform will assign a random, unique name.

Type: `string`

Default: `null`

### <a name="input_state"></a> [state](#input\_state)

Description: State of the rule. Valid values are DISABLED, ENABLED, and ENABLED\_WITH\_ALL\_CLOUDTRAIL\_MANAGEMENT\_EVENTS.

Type: `string`

Default: `"ENABLED"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: EventBridge rule
<!-- END_TF_DOCS -->