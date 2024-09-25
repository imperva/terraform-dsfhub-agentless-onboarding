# Onboard Azure Database for PostgreSQL Flexible example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Database-for-PostgreSQL-Flexible-Server-Onboarding-Steps_84345082.html).

This example creates 'azurerm' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
This module expects an Event Hub and a Storage Account Container to have been created in advance, in addition to a corresponding existing AZURE EVENTHUB asset in DSF. Both of these prerequisites and all related resources are handled in the ``onboard-azure-eventhub`` module. It also expects a method to connect to the PostgreSQL instance to create the ``pgaudit`` extension.

### Azure Event Hub Namespace and Event Hub
Cosmos DB audit logs are sent to an Azure Event Hub and are retrieved by DSF. The Event Hubs are created within an Event Hub Namespace, which can contain one or more Event Hubs. Audit logs of multiple Cosmos DB instances can be sent to a single Event Hub. 

### Azure Storage Account and Container
Storage Containers are used to store transactional data for the Event Hub import processes, and one Storage Container is required for each Event Hub. These Storage Containers exist within a Storage Account, which may contain multiple Storage Containers.

### Database Configuration
Part of the onboarding process involves connecting to your Azure PostgreSQL instance and running SQL commands to create a role. This module includes an example for how to connect to the instance from your local machine and create this. 

