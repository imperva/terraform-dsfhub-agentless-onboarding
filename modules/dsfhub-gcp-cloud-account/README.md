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
| [dsfhub_cloud_account.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/cloud_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Unique identifier of the GCP account in the form '<service account email>:<default project ID>' (e.g. my-service-account-name@my-project-id.iam.gserviceaccount.com:default-project-id-for-this-asset). | `string` | n/a | yes |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Specifies the auth mechanism used by the connection. Supported values: default, service\_account. | `string` | `"default"` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_key_file"></a> [key\_file](#input\_key\_file) | Path to JSON file with credentials info (service account's key) residing on your Agentless Gateway. File must be accessible by the sonarw OS user. Required when auth\_mechanism is set to 'service\_account'. | `string` | `null` | no |
| <a name="input_reason"></a> [reason](#input\_reason) | Used to differentiate connections that belong to the same asset | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | GCP cloud account asset. |
<!-- END_TF_DOCS -->