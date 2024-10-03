# Onboard Azure SQL Server example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-SQL-Server-Onboarding-Steps_48367377.html).

This example creates both 'azurerm' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
This module expects an Event Hub and a Storage Account Container to have been created in advance, in addition to a corresponding existing AZURE EVENTHUB asset in DSF. Both of these prerequisites and all related resources are handled in the ``onboard-azure-eventhub`` module.

### Azure Event Hub Namespace and Event Hub
SQL Server audit logs are sent to an Azure Event Hub and are retrieved by DSF. The Event Hubs are created within an Event Hub Namespace, which can contain one or more Event Hubs. Audit logs of multiple SQL Server instances can be sent to a single Event Hub. 

### Azure Storage Account and Container
Storage Containers are used to store transactional data for the Event Hub import processes, and one Storage Container is required for each Event Hub. These Storage Containers exists within a Storage Account, which may contain multiple Storage Containers.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_azure-ms-sql-server-1"></a> [azure-ms-sql-server-1](#module\_azure-ms-sql-server-1)

Source: ../../modules/onboard-azure-ms-sql-server

Version:

### <a name="module_azure-ms-sql-server-2"></a> [azure-ms-sql-server-2](#module\_azure-ms-sql-server-2)

Source: ../../modules/onboard-azure-ms-sql-server

Version:

### <a name="module_onboard-azure-sql-server-eventhub-1"></a> [onboard-azure-sql-server-eventhub-1](#module\_onboard-azure-sql-server-eventhub-1)

Source: ../../modules/onboard-azure-eventhub

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host)

Description: n/a

Type: `any`

### <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token)

Description: n/a

Type: `any`

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
