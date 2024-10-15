<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_logging_project_sink.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | A description of this sink. The maximum length of the description is 8000 characters. | `string` | `""` | no |
| <a name="input_exclusions"></a> [exclusions](#input\_exclusions) | A list of exclusion objects as defined below.<br><br>  exclusion:<br>  - description: (Optional) A description of this exclusion.<br>  - filter:  An advanced logs filter that matches the log entries to be excluded.<br>  - name: A client-assigned identifier for the exclusion filter. | <pre>list(<br>    object(<br>      {<br>        description = optional(string)<br>        filter      = string<br>        name        = string<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_filter"></a> [filter](#input\_filter) | The filter to apply when exporting logs. Only log entries that match the filter are exported. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the logging sink. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project to create the sink in. If omitted, the project associated with the provider is used. | `string` | `null` | no |
| <a name="input_pubsub_topic_id"></a> [pubsub\_topic\_id](#input\_pubsub\_topic\_id) | ID of the PubSub topic to forward logs to, in the form of '/projects/[PROJECT\_ID]/topics/[TOPIC\_ID]'. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | GCP project level sink. |
<!-- END_TF_DOCS -->