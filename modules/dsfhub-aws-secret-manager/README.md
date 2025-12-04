# dsfhub-aws-secret-manager

More information can be found in the [AWS Secrets Manager Integration Steps](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/AWS-Secrets-Manager-Integration-Steps_267551532.html) page.
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
| [dsfhub_secret_manager.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/secret_manager) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_id"></a> [access\_id](#input\_access\_id) | AWS Access ID | `string` | `null` | no |
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | AWS ARN, e.g. "arn:aws:iam::1234567890" | `string` | n/a | yes |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection for the account asset | `string` | `null` | no |
| <a name="input_available_regions"></a> [available\_regions](#input\_available\_regions) | A list of regions to use in discovery actions that iterate through regions. | `list(string)` | `null` | no |
| <a name="input_ca_certs_path"></a> [ca\_certs\_path](#input\_ca\_certs\_path) | Certificate authority certificates path; what location should the sysetm look for certificate information from. Equivalent to --capath in a curl call. | `string` | `null` | no |
| <a name="input_credentials_endpoint"></a> [credentials\_endpoint](#input\_credentials\_endpoint) | A specific STS endpoint to use. | `string` | `null` | no |
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | The external ID to be used when assuming roles in the target account. | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_http"></a> [http](#input\_http) | HTTP proxy endpoint to use for AWS proxy config calls. | `string` | `null` | no |
| <a name="input_https"></a> [https](#input\_https) | HTTPS proxy endpoint to use for AWS proxy config calls. | `string` | `null` | no |
| <a name="input_logs"></a> [logs](#input\_logs) | Logs service endpoint to use for AWS calls. | `string` | `null` | no |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | The name of a profile in /path/to/JSONAR\_LOCALDIR/credentials/.aws/credentials to use for authentication | `string` | `null` | no |
| <a name="input_proxy"></a> [proxy](#input\_proxy) | Proxy to use for AWS calls if aws\_proxy\_config is populated the proxy field will get populated from the http value there. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Default AWS region of the account | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | AWS secret key | `string` | `null` | no |
| <a name="input_session_token"></a> [session\_token](#input\_session\_token) | STS token used for session authentication. | `string` | `null` | no |
| <a name="input_ssl"></a> [ssl](#input\_ssl) | Specifies whether to use SSL when connecting. | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS secret manager asset. |
<!-- END_TF_DOCS -->