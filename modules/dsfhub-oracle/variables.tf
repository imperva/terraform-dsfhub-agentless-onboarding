variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "application" {
  description = "The application associated with the asset."
  type        = string
  default     = null
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "The unique identifier or resource name of the asset. For most assets this should be a concatenation of Server Host Name + Server Type + Service Name + Server Port with \u201c:\u201d (colon) as separator."
  type        = string
}

variable "asset_version" {
  description = "Oracle database version."
  type        = number
  default     = null
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs. Valid values are: SYSLOG, SYSAUD, UNIFIED, UNIFIED_AGGREGATED, MIXED, MIXED_UNIFIED."
  type        = string
  default     = null
  validation {
    condition     = var.audit_type == null || can(contains(["SYSLOG", "SYSAUD", "UNIFIED", "UNIFIED_AGGREGATED", "MIXED", "MIXED_UNIFIED"], var.audit_type))
    error_message = "audit_type must be one of: SYSLOG, SYSAUD, UNIFIED, UNIFIED_AGGREGATED, MIXED, MIXED_UNIFIED."
  }
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection. Valid values are: password, kerberos, oracle_wallet."
  type        = string
  default     = null
  validation {
    condition = (
      var.auth_mechanism == null ||
      can(contains(["password", "kerberos", "oracle_wallet"], var.auth_mechanism))
    )
    error_message = "Invalid authentication mechanism. Supported values: password, kerberos, oracle_wallet"
  }
}

variable "autocommit" {
  description = "If true, commit automatically without waiting for the transaction to be explicitly committed."
  type        = bool
  default     = null
}

variable "cache_file" {
  description = "Holds Kerberos protocol credentials (for example, tickets, session keys and other identifying information)."
  type        = string
  default     = null
}

variable "db_role" {
  description = "The database role to use when connecting to the Oracle database."
  type        = string
  default     = null
}

variable "dn" {
  description = "The distinguished name of a particular PKI certificate."
  type        = string
  default     = null
}

variable "driver" {
  description = "A path to a non-default driver location. If populated this driver will be used rather than the default."
  type        = string
  default     = null
}

variable "dsn" {
  description = "Data Source Name for the Oracle Wallet connection."
  type        = string
  default     = null
}

variable "external" {
  description = "If true, use external authentication."
  type        = bool
  default     = null
}

variable "extra_kinit_parameters" {
  description = "Additional parameters to pass to the kinit command."
  type        = string
  default     = null
}

variable "kerberos_kdc" {
  description = "The Kerberos Key Distribution Center (KDC) hostname or IP."
  type        = string
  default     = null
}

variable "kerberos_service_kdc" {
  description = "The Kerberos service KDC."
  type        = string
  default     = null
}

variable "kerberos_service_realm" {
  description = "The Kerberos service realm."
  type        = string
  default     = null
}

variable "kerberos_spn" {
  description = "The service and host of the Sybase Kerberos Principal. This will be the value prior to the '@' symbol of the principal value."
  type        = string
  default     = null
}

variable "keytab_file" {
  description = "The path to a non-default keytab location."
  type        = string
  default     = null
}

variable "kinit_program_path" {
  description = "The path to a non-default kinit program."
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "host_timezone_offset" {
  description = "The offset value string is in the format \"-/+hh:mm\""
  type        = string
  default     = null
}

variable "marker_alias" {
  description = "Cluster or System name for a DR pair or similar system where all nodes share a single log. All machines sharing a marker alias will use the same marker. This means that the log will be pulled once rather than once per machine."
  type        = string
  default     = null
}

variable "max_concurrent_conn" {
  description = "Maximum number of concurrent connections that sensitive data management should use at once."
  type        = number
  default     = null
}

variable "net_service_name" {
  description = "Alias in tnsnames.ora replaces hostname, service name, and port in connection string."
  type        = string
  default     = null
}

variable "odbc_connection_string" {
  description = "Additional ODBC connection string parameters. This string will get added to the connection string. E.g. ;MaxVarchar=65535"
  type        = string
  default     = null
}

variable "password" {
  description = "Password used to connect to the database."
  type        = string
  default     = null
}

variable "path" {
  description = "HashiCorp Vault path where the secret is stored."
  type        = string
  default     = null
}

variable "principal" {
  description = "The principal used to authenticate."
  type        = string
  default     = null
}

variable "region" {
  description = "For cloud systems with regions, the default region or region used with this asset."
  type        = string
  default     = null
}

variable "secret_asset_id" {
  description = "The asset_id of the secret manager asset where the secret is stored."
  type        = string
  default     = null
}

variable "secret_field_mapping" {
  description = "Mapping of connection parameters to fields within the secret."
  type = object({
    autocommit             = optional(bool, null)
    cache_file             = optional(string, null)
    db_role                = optional(string, null)
    driver                 = optional(string, null)
    dn                     = optional(string, null)
    dsn                    = optional(string, null)
    external               = optional(number, null)
    extra_kinit_parameters = optional(number, null)
    kerberos_kdc           = optional(string, null)
    kerberos_service_kdc   = optional(string, null)
    kerberos_service_realm = optional(string, null)
    kerberos_spn           = optional(string, null)
    keytab_file            = optional(string, null)
    kinit_program_path     = optional(string, null)
    net_service_name       = optional(string, null)
    odbc_connection_string = optional(string, null)
    password               = optional(string, null)
    principal              = optional(string, null)
    sid                    = optional(string, null)
    ssl                    = optional(bool, null)
    ssl_server_cert        = optional(string, null)
    use_keytab             = optional(bool, null)
    username               = optional(string, null)
    wallet_dir             = optional(string, null)
  })
  default = null
}

variable "secret_name" {
  description = "The name of the secret within the secret manager."
  type        = string
  default     = null
}

variable "secret_type" {
  description = "Which secrets manager to use: amazon, cyberark, or hashicorp."
  type        = string
  default     = null
  validation {
    condition     = var.secret_type == null || can(contains(["amazon", "cyberark", "hashicorp", ""], var.secret_type))
    error_message = "secret_type must be one of: amazon, cyberark, hashicorp."
  }
}

variable "server_host_name" {
  description = "Hostname (or IP if name is unknown) of the Oracle database server."
  type        = string
}

variable "server_ip" {
  description = "IP address of the service where this asset is located. If no IP is available populate this field with other information that would identify the system."
  type        = string
}

variable "server_port" {
  description = "Port used by the source server. Defaults to 1521."
  type        = string
  default     = "1521"
}

variable "service_name" {
  description = "Service Name used to connect, e.g. ORCL."
  type        = string
}

variable "sid" {
  description = "SID used to connect, e.g. ORCL."
  type        = string
  default     = null
}

variable "ssl" {
  description = "If true, use SSL to connect to the database."
  type        = bool
  default     = null
}

variable "ssl_server_cert" {
  description = "Path to server certificate to use during authentication."
  type        = string
  default     = null
}

variable "use_keytab" {
  description = "If true, use the keytab file for authentication."
  type        = bool
  default     = null
}

variable "username" {
  description = "Username used to connect to the database."
  type        = string
  default     = null
}

variable "wallet_dir" {
  description = "Path to the directory where the Oracle Wallet is stored."
  type        = string
  default     = null
}
