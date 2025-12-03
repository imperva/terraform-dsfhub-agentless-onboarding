# dsfhub-hashicorp-secret-manager

More information can be found in the [HashiCorp Vault Integration Steps](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/HashiCorp-Vault-Integration-Steps_793411585.html) page.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | >= 1.3.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_secret_manager.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/secret_manager) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_id"></a> [access\_id](#input\_access\_id) | Used for the iam\_role auth\_mechanism, it is the AWS access key. | `string` | `null` | no |
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Unique identifier of the asset. | `string` | n/a | yes |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Supported values: root\_token, ec2, iam\_role, app\_role. Defaults to iam\_role. | `string` | `null` | no |
| <a name="input_aws_iam_server_id"></a> [aws\_iam\_server\_id](#input\_aws\_iam\_server\_id) | The server ID of the AWS IAM server. E.g. vault.example.com | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_headers"></a> [headers](#input\_headers) | Additional parameters to pass as HTTP headers. Separate with commas. Do not use quotation marks. Example\_value='TEST-HEADER1: test1, TEST-HEADER2: test2'. | `list(string)` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Specifies which namespace to fetch credentials from if not root. | `string` | `null` | no |
| <a name="input_nonce"></a> [nonce](#input\_nonce) | Stored nonce, automatically added from first call if not already generated. | `string` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol used to connect to the vault server Default is 'http://'. | `string` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The HashiCorp role used for logging into the vault. This is used for the ec2, iam\_role and app\_role auth\_mechanisms. | `string` | `null` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | For the root\_token auth\_mechanism, it is the vault token. For the iam\_role auth\_mechanism, it is the AWS secret. Otherwise, it is the secret access key used to authenticate. | `string` | `null` | no |
| <a name="input_self_signed"></a> [self\_signed](#input\_self\_signed) | If true, the SSL certificate is self-signed. Defaults to false. | `bool` | `false` | no |
| <a name="input_server_host_name"></a> [server\_host\_name](#input\_server\_host\_name) | Hostname of the vault server. | `string` | n/a | yes |
| <a name="input_server_ip"></a> [server\_ip](#input\_server\_ip) | IP address / hostname of the vault server. | `string` | n/a | yes |
| <a name="input_server_port"></a> [server\_port](#input\_server\_port) | Port that the vault server listens on. Defaults to 8200. | `string` | `"8200"` | no |
| <a name="input_ssl"></a> [ssl](#input\_ssl) | Specifies whether to use SSL when connecting. | `bool` | `null` | no |
| <a name="input_store_aws_credentials"></a> [store\_aws\_credentials](#input\_store\_aws\_credentials) | Is this connection used with the HashiCorp AWS integration (Dynamic Secret) to generate temporary key pairs for this system to use. Also set to True if using HashiCorp Dynamic. | `bool` | `null` | no |
| <a name="input_v2_key_engine"></a> [v2\_key\_engine](#input\_v2\_key\_engine) | Indicates whether the HashiCorp Key/Value (KV) version 2 secrets engine is used. | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | HASHICORP secret manager asset. |
<!-- END_TF_DOCS -->