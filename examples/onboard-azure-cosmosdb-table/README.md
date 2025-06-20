# Onboard Azure Cosmos DB API for Table example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Cosmos-DB-for-Table-Onboarding-Steps_48367270.html).

This example creates 'azurerm' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
This module expects an Event Hub and a Storage Account Container to have been created in advance, in addition to a corresponding existing AZURE EVENTHUB asset in DSF. Both of these prerequisites and all related resources are handled in the ``onboard-azure-eventhub`` module.

### Azure Event Hub Namespace and Event Hub
Cosmos DB audit logs are sent to an Azure Event Hub and are retrieved by DSF. The Event Hubs are created within an Event Hub Namespace, which can contain one or more Event Hubs. Audit logs of multiple Cosmos DB instances can be sent to a single Event Hub. 

### Azure Storage Account and Container
Storage Containers are used to store transactional data for the Event Hub import processes, and one Storage Container is required for each Event Hub. These Storage Containers exist within a Storage Account, which may contain multiple Storage Containers.
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-cosmosdb-table-1"></a> [azure-cosmosdb-table-1](#module\_azure-cosmosdb-table-1) | ../../modules/onboard-azure-cosmosdb-table | n/a |
| <a name="module_azure-cosmosdb-table-2"></a> [azure-cosmosdb-table-2](#module\_azure-cosmosdb-table-2) | ../../modules/onboard-azure-cosmosdb-table | n/a |
| <a name="module_onboard-cosmos-table-eventhub-1"></a> [onboard-cosmos-table-eventhub-1](#module\_onboard-cosmos-table-eventhub-1) | ../../modules/onboard-azure-eventhub | n/a |

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