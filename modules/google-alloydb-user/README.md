<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_alloydb_user.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster\_id}'. | `string` | n/a | yes |
| <a name="input_database_roles"></a> [database\_roles](#input\_database\_roles) | List of database roles this database user has. | `list(string)` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for this database user. | `string` | n/a | yes |
| <a name="input_user_id"></a> [user\_id](#input\_user\_id) | The database role name of the user. | `string` | n/a | yes |
| <a name="input_user_type"></a> [user\_type](#input\_user\_type) | The type of this user. Possible values are: ALLOYDB\_BUILT\_IN, ALLOYDB\_IAM\_USER. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Google AlloyDB for PostgreSQL user |
<!-- END_TF_DOCS -->