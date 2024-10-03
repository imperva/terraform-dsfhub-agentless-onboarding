# Networking
locals {
  default_managed_instance_security_rules = [
    {
      name                         = "allow_management_inbound"
      access                       = "Allow"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = null
      destination_port_ranges      = ["9000", "9003", "1438", "1440", "1452"]
      direction                    = "Inbound"
      priority                     = 106
      protocol                     = "Tcp"
      source_address_prefix        = "*"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
    {
      name                         = "allow_misubnet_inbound"
      access                       = "Allow"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = "*"
      destination_port_ranges      = null
      direction                    = "Inbound"
      priority                     = 200
      protocol                     = "*"
      source_address_prefix        = "10.0.0.0/24"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
    {
      name                         = "allow_health_probe_inbound"
      access                       = "Allow"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = "*"
      destination_port_ranges      = null
      direction                    = "Inbound"
      priority                     = 300
      protocol                     = "*"
      source_address_prefix        = "AzureLoadBalancer"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
    {
      name                         = "allow_tds_inbound"
      access                       = "Allow"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = "1433"
      destination_port_ranges      = null
      direction                    = "Inbound"
      priority                     = 1000
      protocol                     = "Tcp"
      source_address_prefix        = "VirtualNetwork"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
    {
      name                         = "deny_all_inbound"
      access                       = "Deny"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = "*"
      destination_port_ranges      = null
      direction                    = "Inbound"
      priority                     = 4096
      protocol                     = "*"
      source_address_prefix        = "*"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
    {
      name                         = "allow_management_outbound"
      access                       = "Allow"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = null
      destination_port_ranges      = ["80", "443", "12000"]
      direction                    = "Outbound"
      priority                     = 102
      protocol                     = "Tcp"
      source_address_prefix        = "*"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
    {
      name                         = "allow_misubnet_outbound"
      access                       = "Allow"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = "*"
      destination_port_ranges      = null
      direction                    = "Outbound"
      priority                     = 200
      protocol                     = "*"
      source_address_prefix        = "10.0.0.0/24"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
    {
      name                         = "deny_all_outbound"
      access                       = "Deny"
      description                  = null
      destination_address_prefix   = "*"
      destination_address_prefixes = null
      destination_port_range       = "*"
      destination_port_ranges      = null
      direction                    = "Outbound"
      priority                     = 4096
      protocol                     = "*"
      source_address_prefix        = "*"
      source_address_prefixes      = null
      source_port_range            = "*"
      source_port_ranges           = null
    },
  ]
  merged_managed_instance_security_rules = concat(
    local.default_managed_instance_security_rules,
    var.security_group_security_rules
  )
}

module "security-group" {
  source = "../azurerm-network-security-group"

  location            = var.managed_instance_location
  name                = "${var.managed_instance_name}-security-group"
  resource_group_name = var.security_group_resource_group_name
  security_rules      = local.merged_managed_instance_security_rules
  tags                = var.security_group_tags
}

module "route-table" {
  source = "../azurerm-route-table"

  location            = var.managed_instance_location
  name                = "${var.managed_instance_name}-route-table"
  resource_group_name = var.route_table_resource_group_name
}

module "virtual-network" {
  source = "../azurerm-virtual-network"

  address_space       = ["10.0.0.0/16"]
  location            = var.managed_instance_location
  name                = "vnet-${var.managed_instance_name}"
  resource_group_name = var.virtual_network_resource_group_name

  subnets = [
    {
      address_prefixes = ["10.0.0.0/24"]
      name             = "subnet-${var.managed_instance_name}"
      route_table_id   = module.route-table.this.id
      security_group   = module.security-group.this.id

      delegation = [
        {
          name = "managedinstancedelegation"
          service_delegation = [
            {
              name = "Microsoft.Sql/managedInstances"
              actions = [
                "Microsoft.Network/virtualNetworks/subnets/join/action",
                "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
              ]
            }
          ]
        }
      ]
    }
  ]
}


# Managed Instance
module "azure-ms-sql-managed-instance" {
  source = "../azurerm-mssql-managed-instance"

  administrator_login          = var.managed_instance_administrator_login
  administrator_login_password = var.managed_instance_administrator_login_password
  license_type                 = var.managed_instance_license_type
  location                     = var.managed_instance_location
  name                         = var.managed_instance_name
  public_data_endpoint_enabled = var.managed_instance_public_data_endpoint_enabled
  resource_group_name          = var.managed_instance_resource_group_name
  sku_name                     = var.managed_instance_sku_name
  storage_size_in_gb           = var.managed_instance_storage_size_in_gb
  subnet_id                    = tolist(module.virtual-network.this.subnet)[0].id
  tags                         = var.managed_instance_tags
  vcores                       = var.managed_instance_vcores
}

module "diagnostic-setting" {
  source = "../azurerm-monitor-diagnostic-setting"

  enabled_log                    = [{ category = "SQLSecurityAuditEvents" }]
  eventhub_authorization_rule_id = var.diagnostic_setting_eventhub_authorization_rule_id
  eventhub_name                  = var.diagnostic_setting_eventhub_name
  metric                         = null
  name                           = var.diagnostic_setting_name
  storage_account_id             = null
  target_resource_id             = module.azure-ms-sql-managed-instance.this.id
}

module "azure-sql-managed-instance-asset" {
  source = "../dsfhub-azure-sql-managed-instance"

  admin_email               = var.azure_sql_managed_instance_admin_email
  asset_display_name        = module.azure-ms-sql-managed-instance.this.name
  asset_id                  = module.azure-ms-sql-managed-instance.this.id
  audit_pull_enabled        = var.azure_sql_managed_instance_audit_pull_enabled
  auth_mechanism            = var.azure_sql_managed_instance_auth_mechanism
  database_name             = var.azure_sql_managed_instance_database_name
  gateway_id                = var.azure_sql_managed_instance_gateway_id
  location                  = var.azure_sql_managed_instance_location
  logs_destination_asset_id = var.azure_sql_managed_instance_logs_destination_asset_id
  parent_asset_id           = var.azure_sql_managed_instance_parent_asset_id
  password                  = var.azure_sql_managed_instance_password
  reason                    = var.azure_sql_managed_instance_reason
  server_host_name          = module.azure-ms-sql-managed-instance.this.fqdn
  server_ip                 = module.azure-ms-sql-managed-instance.this.fqdn
  username                  = var.azure_sql_managed_instance_username
}
