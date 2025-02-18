# Onboard Google Cloud Spanner example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Spanner-Onboarding-Steps_48367568.html).

This example creates 'dsfhub' and 'google' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)
- [google](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

## Prerequisites
### Service Account
A Google Service Account will need to be created with permissions to read from PubSub subscriptions. This can be done via the ``google-service-account-dsf`` module. Depending on the authentication mechanism chosen, the service account will either need to be attached to a GCP Compute Engine instance or the service account's credentials file will need to be copied to your Agentless Gateway.

### Google PubSub Subscription
A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF will need to be created in advance. This prerequisite is handled by the ``onboard-gcp-pubsub`` module.
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-pubsub-many-to-one"></a> [gcp-pubsub-many-to-one](#module\_gcp-pubsub-many-to-one) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-one-to-one"></a> [gcp-pubsub-one-to-one](#module\_gcp-pubsub-one-to-one) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-spanner-1"></a> [gcp-spanner-1](#module\_gcp-spanner-1) | ../../modules/onboard-gcp-spanner | n/a |
| <a name="module_gcp-spanner-2"></a> [gcp-spanner-2](#module\_gcp-spanner-2) | ../../modules/onboard-gcp-spanner | n/a |
| <a name="module_service-account"></a> [service-account](#module\_service-account) | ../../modules/google-service-account-dsf | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->