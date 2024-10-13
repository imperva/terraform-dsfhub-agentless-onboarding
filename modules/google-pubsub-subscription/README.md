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
| [google_pubsub_subscription.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_message_retention_duration"></a> [message\_retention\_duration](#input\_message\_retention\_duration) | How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If retain\_acked\_messages is true, then this also configures the retention of acknowledged messages. Defaults to 7 days. | `string` | `"604800s"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the subscription. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project to create the subscription in. If omitted, the project associated with the provider is used. | `string` | `null` | no |
| <a name="input_retain_acked_messages"></a> [retain\_acked\_messages](#input\_retain\_acked\_messages) | Indicates whether to retain acknowledged messages. If true, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window. Defaults to false. | `bool` | `false` | no |
| <a name="input_topic"></a> [topic](#input\_topic) | A reference to a Topic resource, of the form projects/{project}/topics/{{name}} (as in the id property of a google\_pubsub\_topic), or just a topic name if the topic is in the same project as the subscription. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Google PubSub Subscription. |
<!-- END_TF_DOCS -->