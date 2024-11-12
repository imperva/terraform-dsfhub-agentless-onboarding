# onboard-gcp-pubsub
Creates and onboards a Google PubSub Subscription to DSF Hub alongside a Logging Router and PubSub Topic that forward logs to the subscription.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-pubsub-asset"></a> [gcp-pubsub-asset](#module\_gcp-pubsub-asset) | ../dsfhub-gcp-pubsub | n/a |
| <a name="module_pubsub-subscription"></a> [pubsub-subscription](#module\_pubsub-subscription) | ../google-pubsub-subscription | n/a |
| <a name="module_pubsub-topic"></a> [pubsub-topic](#module\_pubsub-topic) | ../google-pubsub-topic | n/a |
| <a name="module_sink-router"></a> [sink-router](#module\_sink-router) | ../google-logging-project-sink | n/a |

## Resources

| Name | Type |
|------|------|
| [google_pubsub_topic_iam_binding.topic_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_pubsub_admin_email"></a> [gcp\_pubsub\_admin\_email](#input\_gcp\_pubsub\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_pubsub_audit_pull_enabled"></a> [gcp\_pubsub\_audit\_pull\_enabled](#input\_gcp\_pubsub\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `null` | no |
| <a name="input_gcp_pubsub_audit_type"></a> [gcp\_pubsub\_audit\_type](#input\_gcp\_pubsub\_audit\_type) | Identifier for the type of audit data contained within the PubSub Subscription. Supported values: ALLOYDB\_POSTGRESQL, BIGQUERY, BIGTABLE, MYSQL, MYSQL\_SLOW, MSSQL, POSTGRESQL, SPANNER. | `string` | `null` | no |
| <a name="input_gcp_pubsub_auth_mechanism"></a> [gcp\_pubsub\_auth\_mechanism](#input\_gcp\_pubsub\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Supported values: default, service\_account. | `string` | `"default"` | no |
| <a name="input_gcp_pubsub_content_type"></a> [gcp\_pubsub\_content\_type](#input\_gcp\_pubsub\_content\_type) | Desired 'parent' asset 'Server Type' which is the one tha tuses this asset as a destination for logs. NOTE: The content\_type field will take precedence on the lookup for parent\_asset\_id field when checking which server is sending logs to this asset. | `string` | `null` | no |
| <a name="input_gcp_pubsub_gateway_id"></a> [gcp\_pubsub\_gateway\_id](#input\_gcp\_pubsub\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_pubsub_key_file"></a> [gcp\_pubsub\_key\_file](#input\_gcp\_pubsub\_key\_file) | Path to JSON file with credentials info (service account's key) residing on your Agentless Gateway. File must be accessible by the sonarw OS user. Required when auth\_mechanism is set to 'service\_account'. | `string` | `null` | no |
| <a name="input_gcp_pubsub_reason"></a> [gcp\_pubsub\_reason](#input\_gcp\_pubsub\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project to create the resources in. If omitted, the project associated with the provider is used. | `string` | `null` | no |
| <a name="input_pubsub_subscription_message_retention_duration"></a> [pubsub\_subscription\_message\_retention\_duration](#input\_pubsub\_subscription\_message\_retention\_duration) | How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If retain\_acked\_messages is true, then this also configures the retention of acknowledged messages. Defaults to 7 days. | `string` | `"604800s"` | no |
| <a name="input_pubsub_subscription_name"></a> [pubsub\_subscription\_name](#input\_pubsub\_subscription\_name) | Name of the subscription. | `string` | n/a | yes |
| <a name="input_pubsub_subscription_retain_acked_messages"></a> [pubsub\_subscription\_retain\_acked\_messages](#input\_pubsub\_subscription\_retain\_acked\_messages) | Indicates whether to retain acknowledged messages. If true, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window. Defaults to false. | `bool` | `false` | no |
| <a name="input_pubsub_topic_name"></a> [pubsub\_topic\_name](#input\_pubsub\_topic\_name) | Name of the topic. | `string` | n/a | yes |
| <a name="input_sink_router_description"></a> [sink\_router\_description](#input\_sink\_router\_description) | A description of this sink. The maximum length of the description is 8000 characters. | `string` | `""` | no |
| <a name="input_sink_router_exclusions"></a> [sink\_router\_exclusions](#input\_sink\_router\_exclusions) | A list of exclusion objects as defined below.<br><br>  exclusion:<br>  - description: (Optional) A description of this exclusion.<br>  - filter:  An advanced logs filter that matches the log entries to be excluded.<br>  - name: A client-assigned identifier for the exclusion filter. | <pre>list(<br>    object(<br>      {<br>        description = optional(string)<br>        filter      = string<br>        name        = string<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_sink_router_filter"></a> [sink\_router\_filter](#input\_sink\_router\_filter) | The filter to apply when exporting logs. Only log entries that match the filter are exported. | `string` | n/a | yes |
| <a name="input_sink_router_name"></a> [sink\_router\_name](#input\_sink\_router\_name) | The name of the logging sink. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp-pubsub-asset"></a> [gcp-pubsub-asset](#output\_gcp-pubsub-asset) | GCP PUBSUB asset. |
| <a name="output_pubsub-subscription"></a> [pubsub-subscription](#output\_pubsub-subscription) | Google PubSub Subscription. |
| <a name="output_pubsub-topic"></a> [pubsub-topic](#output\_pubsub-topic) | Google PubSub Topic. |
| <a name="output_sink-router"></a> [sink-router](#output\_sink-router) | Google Log Router. |
| <a name="output_topic-binding"></a> [topic-binding](#output\_topic-binding) | Google PubSub Topic IAM Binding. |
<!-- END_TF_DOCS -->