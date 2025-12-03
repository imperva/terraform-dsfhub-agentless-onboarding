# dsfhub-cyberark-secret-manager

More information can be found in the [CyberArk Integration Steps](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/CyberArk-Integration-Steps_96665669.html) page.
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_secret_manager.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/secret_manager) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Unique identifier of the asset. | `string` | n/a | yes |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Currently only 'default' is supported for CyberArk. | `string` | `null` | no |
| <a name="input_ca_certs_path"></a> [ca\_certs\_path](#input\_ca\_certs\_path) | Path to the RootCA cert. | `string` | `null` | no |
| <a name="input_cert_file"></a> [cert\_file](#input\_cert\_file) | Certificate used for access. | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_key_file"></a> [key\_file](#input\_key\_file) | Path to Key used for accessing cyberark. | `string` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | A protocol prefix to use to connect if it isn't already specified in the host name. E.g http:// or https://. | `string` | `null` | no |
| <a name="input_query"></a> [query](#input\_query) | Query parameters defining where the passwords, etc. should be retrieved from. Example:AppID=<your\_CyberArk\_Application\_ID>&Safe=<your\_CyberArk\_Safe\_Name>;Folder=Root;(This is everything to be included in the curl string from Accounts? and Object= in the call to retrieve things from Cyberark.). | `string` | n/a | yes |
| <a name="input_self_signed"></a> [self\_signed](#input\_self\_signed) | If true, the connection will use the -k flag to accept self signed certificates. Defaults to false. | `bool` | `false` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Hostname of the vault server. E.g. https://services-uscentral.skytap.com | `string` | n/a | yes |
| <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip) | IP address / hostname of the vault server. | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Port that the CyberArk server listens on. Defaults to 16114 for https. Use 11535 for http. | `string` | `"16114"` | no |
| <a name="input_ssl"></a> [ssl](#input\_ssl) | Specifies whether to use SSL when connecting. | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | CYBERARK secret manager asset. |
<!-- END_TF_DOCS -->