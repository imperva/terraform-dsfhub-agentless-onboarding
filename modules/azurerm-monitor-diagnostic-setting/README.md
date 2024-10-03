<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created.

Type: `string`

### <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id)

Description: The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enabled_log"></a> [enabled\_log](#input\_enabled\_log)

Description: Map of categories/category groups to be enabled in the diagnostic setting. Only one of category and category\_group can be specified per block.

Type:

```hcl
list(
    object(
      {
        category       = optional(string)
        category_group = optional(string)
      }
    )
  )
```

Default: `null`

### <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id)

Description: Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data.

Type: `string`

Default: `null`

### <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name)

Description: Specifies the name of the Event Hub where Diagnostics Data should be sent.

Type: `string`

Default: `null`

### <a name="input_metric"></a> [metric](#input\_metric)

Description: Map of metric categories to be enabled in the diagnostic setting.

Type:

```hcl
list(
    object(
      {
        category = string
        enabled  = optional(bool, true)
      }
    )
  )
```

Default: `null`

### <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id)

Description: The ID of the Storage Account where logs should be sent.

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: Diagnostic Setting
<!-- END_TF_DOCS -->