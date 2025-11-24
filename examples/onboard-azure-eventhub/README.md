# Onboard Azure EventHub Examples

This example covers the various authentication mechanisms that are supported for Azure Event Hub log aggregator assets, as part of the `onboard-azure-eventhub`. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| default | Uses the default Azure Event Hub authentication, relying on an access key and a secret key. |
| client_secret | Uses a client secret to authenticate to Azure Event Hub, which requires the following fields to authenticate: client_id, client_secret, and tenant_id. For more information visit: https://learn.microsoft.com/en-us/python/api/azure-identity/azure.identity.clientsecretcredential?view=azure-python. |
| azure_ad | Applications are commonly authenticated with Microsoft Entra ID to access Event Hubs resources, however the identity may depend on the environment. For more information visit: https://learn.microsoft.com/en-us/azure/event-hubs/authenticate-application |

More information can be found in the [Azure Event Hub Asset Specifications](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Event-Hub-Asset-Specifications_35815951.html).
