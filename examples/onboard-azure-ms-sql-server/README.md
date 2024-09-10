# Onboard Azure SQL Server example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-SQL-Server-Onboarding-Steps_48367377.html).

This example creates both 'azurerm' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Azure Event Hub Namespace and Event Hub
SQL Server audit logs are sent to an Azure Event Hub and are retrieved by DSF. The Event Hubs are created inside of an Event Hub Namespace, which can contain one or more Event Hubs. Audit logs of multiple SQL Server instances can be sent to a single Event Hub. This module expects an Event Hub to have been created in advance, and will create a corresponding AZURE EVENTHUB asset for it.

### Azure Storage Account and Container
Storage Containers are used to store transactional data for the Event Hub import processes, and one Storage Container is required for each Event Hub. These Storage Containers exists inside a Storage Account, which may contain multiple Storage Containers.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-ms-sql-server-1"></a> [azure-ms-sql-server-1](#module\_azure-ms-sql-server-1) | ../../modules/onboard-azure-ms-sql-server | n/a |
| <a name="module_eventhub"></a> [eventhub](#module\_eventhub) | ../../modules/azurerm-eventhub | n/a |
| <a name="module_eventhub-namespace"></a> [eventhub-namespace](#module\_eventhub-namespace) | ../../modules/azurerm-eventhub-namespace | n/a |
| <a name="module_eventhub-read-authorization"></a> [eventhub-read-authorization](#module\_eventhub-read-authorization) | ../../modules/azurerm-eventhub-namespace-authorization-rule | n/a |
| <a name="module_eventhub-write-authorization"></a> [eventhub-write-authorization](#module\_eventhub-write-authorization) | ../../modules/azurerm-eventhub-namespace-authorization-rule | n/a |
| <a name="module_storage-account"></a> [storage-account](#module\_storage-account) | ../../modules/azurerm-storage-account | n/a |
| <a name="module_storage-container"></a> [storage-container](#module\_storage-container) | ../../modules/azurerm-storage-container | n/a |

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
