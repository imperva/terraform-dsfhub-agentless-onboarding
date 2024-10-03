# Onboard Azure Database for PostgreSQL Flexible example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Database-for-PostgreSQL-Flexible-Server-Onboarding-Steps_84345082.html).

This example creates 'azurerm' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
This module expects an Event Hub and a Storage Account Container to have been created in advance, in addition to a corresponding existing AZURE EVENTHUB asset in DSF. Both of these prerequisites and all related resources are handled in the ``onboard-azure-eventhub`` module. It also expects a method to connect to the PostgreSQL instance to create the ``pgaudit`` extension.

### Azure Event Hub Namespace and Event Hub
PostgreSQL audit logs are sent to an Azure Event Hub and are retrieved by DSF. The Event Hubs are created within an Event Hub Namespace, which can contain one or more Event Hubs. Audit logs of multiple PostgreSQL instances can be sent to a single Event Hub. 

### Azure Storage Account and Container
Storage Containers are used to store transactional data for the Event Hub import processes, and one Storage Container is required for each Event Hub. These Storage Containers exist within a Storage Account, which may contain multiple Storage Containers.

### Database Configuration
Part of the onboarding process involves connecting to your Azure PostgreSQL instance and running SQL commands to create a role. This module includes an example for how to connect to the instance from your local machine and create this. 


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

- <a name="provider_http"></a> [http](#provider\_http)

- <a name="provider_terraform"></a> [terraform](#provider\_terraform)

## Modules

The following Modules are called:

### <a name="module_azure-postgresql-flexible-1"></a> [azure-postgresql-flexible-1](#module\_azure-postgresql-flexible-1)

Source: ../../modules/onboard-azure-postgresql-flexible

Version:

### <a name="module_azure-postgresql-flexible-2"></a> [azure-postgresql-flexible-2](#module\_azure-postgresql-flexible-2)

Source: ../../modules/onboard-azure-postgresql-flexible

Version:

### <a name="module_azure-postgresql-flexible-3"></a> [azure-postgresql-flexible-3](#module\_azure-postgresql-flexible-3)

Source: ../../modules/onboard-azure-postgresql-flexible

Version:

### <a name="module_onboard-azure-postgresql-flexible-eventhub-1"></a> [onboard-azure-postgresql-flexible-eventhub-1](#module\_onboard-azure-postgresql-flexible-eventhub-1)

Source: ../../modules/onboard-azure-eventhub

Version:

## Resources

The following resources are used by this module:

- [azurerm_postgresql_flexible_server_firewall_rule.my-ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule) (resource)
- [terraform_data.configure_database](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) (resource)
- [http_http.my-ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) (data source)

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