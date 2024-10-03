# Onboard Azure SQL Managed Instance example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-SQL-Managed-Instance-Onboarding-Steps_48367362.html).

This example creates 'azurerm' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
This module expects an Event Hub and a Storage Account Container to have been created in advance, in addition to a corresponding existing AZURE EVENTHUB asset in DSF. Both of these prerequisites and all related resources are handled in the ``onboard-azure-eventhub`` module. It also expects a method to connect to the SQL Managed instance to create a server audit policy.

### Azure Event Hub Namespace and Event Hub
SQL Managed instance audit logs are sent to an Azure Event Hub and are retrieved by DSF. The Event Hubs are created within an Event Hub Namespace, which can contain one or more Event Hubs. Audit logs of multiple SQL Managed instances can be sent to a single Event Hub. 

### Azure Storage Account and Container
Storage Containers are used to store transactional data for the Event Hub import processes, and one Storage Container is required for each Event Hub. These Storage Containers exist within a Storage Account, which may contain multiple Storage Containers.

### Database Configuration
Part of the onboarding process involves connecting to your SQL Managed instance and running SQL commands to create an audit policy. This module includes an example for how to connect to the instance from your local machine and create it. 

**Note:** This example requires the ``sqlcmd`` client to be installed, as well as for the newly created SQL Managed instance to be accessible from your local machine. 

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_onboard-azure-sql-managed-instance-eventhub-1"></a> [onboard-azure-sql-managed-instance-eventhub-1](#module\_onboard-azure-sql-managed-instance-eventhub-1) | ../../modules/onboard-azure-eventhub | n/a |
| <a name="module_sql-managed-instance-1"></a> [sql-managed-instance-1](#module\_sql-managed-instance-1) | ../../modules/onboard-azure-sql-managed-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_data.configure_database-1](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [http_http.my-ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->