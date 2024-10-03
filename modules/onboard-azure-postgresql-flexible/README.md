# onboard-azure-postgresql-flexible
Onboard Azure PostgreSQL Flexible to DSF Hub.

## Notes
There are three prerequisites for using this module:
1. An Azure Event Hub Namespace and Event Hub. 
2. An Azure Storage Account and Container. This is used by DSF to store a marker which keeps track of what data in the Event Hub has been consumed.
3. A method to create the 'pgaudit' extension on the postgres instance.

The first two can be created along with an AZURE EVENTHUB asset via the ``onboard-azure-eventhub`` module.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) (>= 1.3.2)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Modules

The following Modules are called:

### <a name="module_azure-postgresql-flexible-asset"></a> [azure-postgresql-flexible-asset](#module\_azure-postgresql-flexible-asset)

Source: ../dsfhub-azure-postgresql-flexible

Version:

### <a name="module_azure-postgresql-flexible-server"></a> [azure-postgresql-flexible-server](#module\_azure-postgresql-flexible-server)

Source: ../azurerm-postgresql-flexible-server

Version:

### <a name="module_postgresql-diagnostic-setting"></a> [postgresql-diagnostic-setting](#module\_postgresql-diagnostic-setting)

Source: ../azurerm-monitor-diagnostic-setting

Version:

## Resources

The following resources are used by this module:

- [azurerm_postgresql_flexible_server_configuration.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_azure_postgresql_flexible_admin_email"></a> [azure\_postgresql\_flexible\_admin\_email](#input\_azure\_postgresql\_flexible\_admin\_email)

Description: The email address to notify about the asset.

Type: `string`

### <a name="input_azure_postgresql_flexible_gateway_id"></a> [azure\_postgresql\_flexible\_gateway\_id](#input\_azure\_postgresql\_flexible\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the asset

Type: `string`

### <a name="input_azure_postgresql_flexible_logs_destination_asset_id"></a> [azure\_postgresql\_flexible\_logs\_destination\_asset\_id](#input\_azure\_postgresql\_flexible\_logs\_destination\_asset\_id)

Description: The asset\_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to.

Type: `string`

### <a name="input_server_administrator_login"></a> [server\_administrator\_login](#input\_server\_administrator\_login)

Description: The Administrator login for the PostgreSQL Flexible Server.

Type: `string`

### <a name="input_server_administrator_password"></a> [server\_administrator\_password](#input\_server\_administrator\_password)

Description: The Password associated with the administrator\_login for the PostgreSQL Flexible Server.

Type: `string`

### <a name="input_server_location"></a> [server\_location](#input\_server\_location)

Description: The Azure Region where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created.

Type: `string`

### <a name="input_server_name"></a> [server\_name](#input\_server\_name)

Description: The name which should be used for this PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created.

Type: `string`

### <a name="input_server_resource_group_name"></a> [server\_resource\_group\_name](#input\_server\_resource\_group\_name)

Description: The name of the Resource Group where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_azure_postgresql_flexible_audit_pull_enabled"></a> [azure\_postgresql\_flexible\_audit\_pull\_enabled](#input\_azure\_postgresql\_flexible\_audit\_pull\_enabled)

Description: If true, sonargateway will collect the audit logs for this system if it can.

Type: `bool`

Default: `false`

### <a name="input_azure_postgresql_flexible_location"></a> [azure\_postgresql\_flexible\_location](#input\_azure\_postgresql\_flexible\_location)

Description: Physical location/region of the PostgreSQL instance, e.g. "EAST US"

Type: `string`

Default: `null`

### <a name="input_azure_postgresql_flexible_parent_asset_id"></a> [azure\_postgresql\_flexible\_parent\_asset\_id](#input\_azure\_postgresql\_flexible\_parent\_asset\_id)

Description: The asset\_id of the AZURE asset representing the Azure account where this server is located.

Type: `string`

Default: `null`

### <a name="input_diagnostic_setting_eventhub_authorization_rule_id"></a> [diagnostic\_setting\_eventhub\_authorization\_rule\_id](#input\_diagnostic\_setting\_eventhub\_authorization\_rule\_id)

Description: Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data.

Type: `string`

Default: `null`

### <a name="input_diagnostic_setting_eventhub_name"></a> [diagnostic\_setting\_eventhub\_name](#input\_diagnostic\_setting\_eventhub\_name)

Description: Specifies the name of the Event Hub where Diagnostics Data should be sent.

Type: `string`

Default: `null`

### <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name)

Description: Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created.

Type: `string`

Default: `"dsfhubdiagnostic"`

### <a name="input_server_configurations"></a> [server\_configurations](#input\_server\_configurations)

Description: List of objects containing the name and value of server configurations, e.g. [ { name = "pgaudit.log", value = "all" } ]

Type:

```hcl
list(
    object(
      {
        name  = string
        value = string
      }
    )
  )
```

Default:

```json
[
  {
    "name": "pgaudit.log",
    "value": "all"
  },
  {
    "name": "log_line_prefix",
    "value": "SONAR_AUDIT=1|TIMESTAMP=%m|APPLICATION_NAME=%a|USER=%u|DATABASE=%d|REMOTE_HOST_AND_PORT=%r|SQL_STATE=%e|SESSION_ID=%c|SESSION_START=%s|PROCESS_ID[%p]|VIRTUAL_TRANSACTION_ID=%v|TRANSACTION_ID=%x|"
  },
  {
    "name": "azure.extensions",
    "value": "pgaudit"
  },
  {
    "name": "shared_preload_libraries",
    "value": "pgaudit"
  }
]
```

### <a name="input_server_postgres_version"></a> [server\_postgres\_version](#input\_server\_postgres\_version)

Description: The version of PostgreSQL Flexible Server to use. Possible values are 11,12, 13, 14, 15 and 16. Defaults to 16.

Type: `number`

Default: `16`

### <a name="input_server_public_network_access_enabled"></a> [server\_public\_network\_access\_enabled](#input\_server\_public\_network\_access\_enabled)

Description: Specifies whether this PostgreSQL Flexible Server is publicly accessible. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_server_sku_name"></a> [server\_sku\_name](#input\_server\_sku\_name)

Description: The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B\_Standard\_B1ms, GP\_Standard\_D2s\_v3, MO\_Standard\_E4s\_v3).  Defaults to GP\_Standard\_D2s\_v3.

Type: `string`

Default: `"GP_Standard_D2s_v3"`

### <a name="input_server_storage_mb"></a> [server\_storage\_mb](#input\_server\_storage\_mb)

Description: The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408. Defaults to 32768.

Type: `number`

Default: `"32768"`

### <a name="input_server_storage_tier"></a> [server\_storage\_tier](#input\_server\_storage\_tier)

Description: The name of storage performance tier for IOPS of the PostgreSQL Flexible Server. Possible values are P4, P6, P10, P15,P20, P30,P40, P50,P60, P70 or P80. Default value is dependant on the storage\_mb value. Please see the storage\_tier defaults based on storage\_mb table [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#storage_tier-defaults-based-on-storage_mb).

Type: `string`

Default: `null`

### <a name="input_server_tags"></a> [server\_tags](#input\_server\_tags)

Description: A mapping of tags to assign to the resource.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_azure-postgresql-flexible-asset"></a> [azure-postgresql-flexible-asset](#output\_azure-postgresql-flexible-asset)

Description: AZURE POSTGRESQL FLEXIBLE asset.

### <a name="output_postgresql-diagnostic-setting"></a> [postgresql-diagnostic-setting](#output\_postgresql-diagnostic-setting)

Description: Diagnostic setting.

### <a name="output_postgresql-server"></a> [postgresql-server](#output\_postgresql-server)

Description: Azure PostgreSQL Flexible server.

### <a name="output_postgresql-server-configurations"></a> [postgresql-server-configurations](#output\_postgresql-server-configurations)

Description: Azure PostgreSQL Flexible server configurations.
<!-- END_TF_DOCS -->