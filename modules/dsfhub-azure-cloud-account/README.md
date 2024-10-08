# dsfhub-azure-cloud-account
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | >= 1.3.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_cloud_account.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/cloud_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | This is also referred to as the Client ID and it’s the unique identifier for the registered application being used to execute Python SDK commands against Azure’s API services. You can find this number under Azure Active Directory -> App Registrations -> Owned Applications. | `string` | `null` | no |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Unique identifier of the Azure account. The following format is a suggestion that guarantees the uniqueness and identifiability between AZURE assets using different application/resource groups: /directory\_id/<directory\_id>/subscription\_id/<subscription\_id>/<resource group name>/application\_id/<application\_id> | `string` | n/a | yes |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Supported values: auth\_file, client\_secret, managed\_identity. | `string` | `null` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | This a string containing a secret used by the application to prove its identity when requesting a token. You can get a secret by going to Azure Active Directory -> App Registrations -> Owned Applications, selecting the desired application and then going to Certificates & secrets -> Client secrets -> + New client secret. | `string` | `null` | no |
| <a name="input_directory_id"></a> [directory\_id](#input\_directory\_id) | This is also referred to as the Tenant ID and is a GUID representing the Active Directory Tenant. It can be found in the Azure Active Directory page under the Azure portal. | `string` | `null` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_key_file"></a> [key\_file](#input\_key\_file) | Path to JSON file with credentials info residing on your Agentless Gateway. File must be accessible by the sonarw OS user. | `string` | `null` | no |
| <a name="input_reason"></a> [reason](#input\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription ID. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AZURE cloud account asset. |
<!-- END_TF_DOCS -->