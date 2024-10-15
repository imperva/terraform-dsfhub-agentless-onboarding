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
| [google_pubsub_topic.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the topic. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project to create the topic in. If omitted, the project associated with the provider is used. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Google PubSub Topic. |
<!-- END_TF_DOCS -->