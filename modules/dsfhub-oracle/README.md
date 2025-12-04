# dsfhub-oracle
Onboard an Oracle asset to DSF Hub.

## Notes
This module supports optionally integrating secrets managers with the dsfhub_data_source resource within its asset_connection block. It relies on the variable `secret_type` which can be one of `amazon`, `cyberark` or `hashicorp`; if it is not set, no secrets manager will be integrated. All the supported `asset_connection` attributes for this `server_type` are set as optional in the `secret_field_mapping` variable and will override the attributes set outside of the secret manager field_mapping.

There is one prerequisite for using this module, if integrating the asset with a secrets manager:
1. An existing `dsfhub_secret_manager` must have already been onboarded to DSF Hub. See the associated example for more details.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | >= 1.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_data_source.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_application"></a> [application](#input\_application) | The application associated with the asset. | `string` | `null` | no |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | The unique identifier or resource name of the asset. For most assets this should be a concatenation of Server Host Name + Server Type + Service Name + Server Port with “:” (colon) as separator. | `string` | n/a | yes |
| <a name="input_asset_version"></a> [asset\_version](#input\_asset\_version) | Oracle database version. | `number` | `null` | no |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs. Valid values are: SYSLOG, SYSAUD, UNIFIED, UNIFIED\_AGGREGATED, MIXED, MIXED\_UNIFIED. | `string` | `null` | no |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Valid values are: password, kerberos, oracle\_wallet. | `string` | `null` | no |
| <a name="input_autocommit"></a> [autocommit](#input\_autocommit) | If true, commit automatically without waiting for the transaction to be explicitly committed. | `bool` | `null` | no |
| <a name="input_cache_file"></a> [cache\_file](#input\_cache\_file) | Holds Kerberos protocol credentials (for example, tickets, session keys and other identifying information). | `string` | `null` | no |
| <a name="input_db_role"></a> [db\_role](#input\_db\_role) | The database role to use when connecting to the Oracle database. | `string` | `null` | no |
| <a name="input_dn"></a> [dn](#input\_dn) | The distinguished name of a particular PKI certificate. | `string` | `null` | no |
| <a name="input_driver"></a> [driver](#input\_driver) | A path to a non-default driver location. If populated this driver will be used rather than the default. | `string` | `null` | no |
| <a name="input_dsn"></a> [dsn](#input\_dsn) | Data Source Name for the Oracle Wallet connection. | `string` | `null` | no |
| <a name="input_external"></a> [external](#input\_external) | If true, use external authentication. | `bool` | `null` | no |
| <a name="input_extra_kinit_parameters"></a> [extra\_kinit\_parameters](#input\_extra\_kinit\_parameters) | Additional parameters to pass to the kinit command. | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_host_timezone_offset"></a> [host\_timezone\_offset](#input\_host\_timezone\_offset) | The offset value string is in the format "-/+hh:mm" | `string` | `null` | no |
| <a name="input_kerberos_kdc"></a> [kerberos\_kdc](#input\_kerberos\_kdc) | The Kerberos Key Distribution Center (KDC) hostname or IP. | `string` | `null` | no |
| <a name="input_kerberos_service_kdc"></a> [kerberos\_service\_kdc](#input\_kerberos\_service\_kdc) | The Kerberos service KDC. | `string` | `null` | no |
| <a name="input_kerberos_service_realm"></a> [kerberos\_service\_realm](#input\_kerberos\_service\_realm) | The Kerberos service realm. | `string` | `null` | no |
| <a name="input_kerberos_spn"></a> [kerberos\_spn](#input\_kerberos\_spn) | The service and host of the Sybase Kerberos Principal. This will be the value prior to the '@' symbol of the principal value. | `string` | `null` | no |
| <a name="input_keytab_file"></a> [keytab\_file](#input\_keytab\_file) | The path to a non-default keytab location. | `string` | `null` | no |
| <a name="input_kinit_program_path"></a> [kinit\_program\_path](#input\_kinit\_program\_path) | The path to a non-default kinit program. | `string` | `null` | no |
| <a name="input_marker_alias"></a> [marker\_alias](#input\_marker\_alias) | Cluster or System name for a DR pair or similar system where all nodes share a single log. All machines sharing a marker alias will use the same marker. This means that the log will be pulled once rather than once per machine. | `string` | `null` | no |
| <a name="input_max_concurrent_conn"></a> [max\_concurrent\_conn](#input\_max\_concurrent\_conn) | Maximum number of concurrent connections that sensitive data management should use at once. | `number` | `null` | no |
| <a name="input_net_service_name"></a> [net\_service\_name](#input\_net\_service\_name) | Alias in tnsnames.ora replaces hostname, service name, and port in connection string. | `string` | `null` | no |
| <a name="input_odbc_connection_string"></a> [odbc\_connection\_string](#input\_odbc\_connection\_string) | Additional ODBC connection string parameters. This string will get added to the connection string. E.g. ;MaxVarchar=65535 | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | Password used to connect to the database. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | HashiCorp Vault path where the secret is stored. | `string` | `null` | no |
| <a name="input_principal"></a> [principal](#input\_principal) | The principal used to authenticate. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | For cloud systems with regions, the default region or region used with this asset. | `string` | `null` | no |
| <a name="input_secret_asset_id"></a> [secret\_asset\_id](#input\_secret\_asset\_id) | The asset\_id of the secret manager asset where the secret is stored. | `string` | `null` | no |
| <a name="input_secret_field_mapping"></a> [secret\_field\_mapping](#input\_secret\_field\_mapping) | Mapping of connection parameters to fields within the secret. | <pre>object({<br>    autocommit             = optional(bool, null)<br>    cache_file             = optional(string, null)<br>    db_role                = optional(string, null)<br>    driver                 = optional(string, null)<br>    dn                     = optional(string, null)<br>    dsn                    = optional(string, null)<br>    external               = optional(number, null)<br>    extra_kinit_parameters = optional(number, null)<br>    kerberos_kdc           = optional(string, null)<br>    kerberos_service_kdc   = optional(string, null)<br>    kerberos_service_realm = optional(string, null)<br>    kerberos_spn           = optional(string, null)<br>    keytab_file            = optional(string, null)<br>    kinit_program_path     = optional(string, null)<br>    net_service_name       = optional(string, null)<br>    odbc_connection_string = optional(string, null)<br>    password               = optional(string, null)<br>    principal              = optional(string, null)<br>    sid                    = optional(string, null)<br>    ssl                    = optional(bool, null)<br>    ssl_server_cert        = optional(string, null)<br>    use_keytab             = optional(bool, null)<br>    username               = optional(string, null)<br>    wallet_dir             = optional(string, null)<br>  })</pre> | `null` | no |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | The name of the secret within the secret manager. | `string` | `null` | no |
| <a name="input_secret_type"></a> [secret\_type](#input\_secret\_type) | Which secrets manager to use: amazon, cyberark, or hashicorp. | `string` | `null` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Hostname (or IP if name is unknown) of the Oracle database server. | `string` | n/a | yes |
| <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip) | IP address of the service where this asset is located. If no IP is available populate this field with other information that would identify the system. | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Port used by the source server. Defaults to 1521. | `string` | `"1521"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service Name used to connect, e.g. ORCL. | `string` | n/a | yes |
| <a name="input_sid"></a> [sid](#input\_sid) | SID used to connect, e.g. ORCL. | `string` | `null` | no |
| <a name="input_ssl"></a> [ssl](#input\_ssl) | If true, use SSL to connect to the database. | `bool` | `null` | no |
| <a name="input_ssl_server_cert"></a> [ssl\_server\_cert](#input\_ssl\_server\_cert) | Path to server certificate to use during authentication. | `string` | `null` | no |
| <a name="input_use_keytab"></a> [use\_keytab](#input\_use\_keytab) | If true, use the keytab file for authentication. | `bool` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | Username used to connect to the database. | `string` | `null` | no |
| <a name="input_wallet_dir"></a> [wallet\_dir](#input\_wallet\_dir) | Path to the directory where the Oracle Wallet is stored. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | ORACLE asset |
<!-- END_TF_DOCS -->