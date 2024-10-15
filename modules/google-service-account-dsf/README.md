# google-service-account-dsf
Creates a Google Service Account with permissions to be used for DSF audit pulls or discovery. Defaults to being granted the minimum permissions required to pull audit data from a PubSub subscription. If ``auth_mechanism = service_account`` is selected, will also create a JSON credentials file for the account that can be copied to an Agentless gateway.


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [local_file.service_account_key_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The account id that is used to generate the service account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression '[a-z]([-a-z0-9]*[a-z0-9])' to comply with RFC1035. Changing this forces a new service account to be created. | `string` | n/a | yes |
| <a name="input_auth_mechanism"></a> [auth\_mechanism](#input\_auth\_mechanism) | Authentication mechanism intended to be used by DSF to leverage this service account. Valid values are: service\_account, default. | `string` | `"service_account"` | no |
| <a name="input_create_ignore_already_exists"></a> [create\_ignore\_already\_exists](#input\_create\_ignore\_already\_exists) | If set to true, skip service account creation if a service account with the same email already exists. Defaults to false. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | A text description of the service account. Must be less than or equal to 256 UTF-8 bytes. | `string` | `null` | no |
| <a name="input_disabled"></a> [disabled](#input\_disabled) | Whether a service account is disabled or not. Defaults to false. This field has no effect during creation. Must be set after creation to disable a service account. | `bool` | `false` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the service account | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project that the service account will be created in. | `string` | n/a | yes |
| <a name="input_project_roles"></a> [project\_roles](#input\_project\_roles) | Roles to grant the Service Account in the specified project. Defaults to roles required for DSF to pull audit data. | `list(string)` | <pre>[<br>  "roles/pubsub.subscriber",<br>  "roles/pubsub.viewer"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | Google Service Account. |
| <a name="output_key"></a> [key](#output\_key) | Authentication key for the Service Account. |
| <a name="output_key_file_path"></a> [key\_file\_path](#output\_key\_file\_path) | JSON key file containing the Service Account credentials. |
| <a name="output_permissions"></a> [permissions](#output\_permissions) | Service Account permissions. |
<!-- END_TF_DOCS -->