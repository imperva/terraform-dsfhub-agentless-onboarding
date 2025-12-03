# Onboard Azure EventHub Examples

This example covers the various authentication mechanisms that are supported for Azure Event Hub log aggregator assets, as part of the `onboard-azure-eventhub`. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| default | Uses the default Azure Event Hub authentication, relying on an access key and a secret key. |
| client_secret | Uses a client secret to authenticate to Azure Event Hub, which requires the following fields to authenticate: client_id, client_secret, and tenant_id. For more information visit: https://learn.microsoft.com/en-us/python/api/azure-identity/azure.identity.clientsecretcredential?view=azure-python. |
| azure_ad | Applications are commonly authenticated with Microsoft Entra ID to access Event Hubs resources, however the identity may depend on the environment. For more information visit: https://learn.microsoft.com/en-us/azure/event-hubs/authenticate-application |

More information can be found in the [Azure Event Hub Asset Specifications](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Event-Hub-Asset-Specifications_35815951.html).

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_onboard-azure-eventhub-azure-ad-1"></a> [onboard-azure-eventhub-azure-ad-1](#module\_onboard-azure-eventhub-azure-ad-1) | ../../modules/onboard-azure-eventhub | n/a |
| <a name="module_onboard-azure-eventhub-azure-ad-2"></a> [onboard-azure-eventhub-azure-ad-2](#module\_onboard-azure-eventhub-azure-ad-2) | ../../modules/onboard-azure-eventhub | n/a |
| <a name="module_onboard-azure-eventhub-client-secret"></a> [onboard-azure-eventhub-client-secret](#module\_onboard-azure-eventhub-client-secret) | ../../modules/onboard-azure-eventhub | n/a |
| <a name="module_onboard-azure-eventhub-default"></a> [onboard-azure-eventhub-default](#module\_onboard-azure-eventhub-default) | ../../modules/onboard-azure-eventhub | n/a |

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