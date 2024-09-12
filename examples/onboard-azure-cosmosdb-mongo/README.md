# Onboard Azure Cosmos DB API for MongoDB example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Cosmos-DB-API-for-MongoDB-Onboarding-Steps_48367240.html).

This example creates 'azurerm' and 'dsfhub' resources. More infomation regarding authentication to each can be found in the relevant provider documentation:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Azure Event Hub Namespace and Event Hub
SQL Server audit logs are sent to an Azure Event Hub and are retrieved by DSF. The Event Hubs are created inside of an Event Hub Namespace, which can contain one or more Event Hubs. Audit logs of multiple SQL Server instances can be sent to a single Event Hub. This module expects an Event Hub to have been created in advance, and will create a corresponding AZURE EVENTHUB asset for it.

### Azure Storage Account and Container
Storage Containers are used to store transactional data for the Event Hub import processes, and one Storage Container is required for each Event Hub. These Storage Containers exists inside a Storage Account, which may contain multiple Storage Containers.
