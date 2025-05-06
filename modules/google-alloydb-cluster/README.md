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
| [google_alloydb_cluster.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_ip_range"></a> [allocated\_ip\_range](#input\_allocated\_ip\_range) | The name of the allocated IP range for the private IP AlloyDB cluster. For example: 'google-managed-services-default'. If set, the instance IPs for this cluster will be created in the allocated range. | `string` | `null` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the alloydb cluster. | `string` | n/a | yes |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of cluster. If not set, defaults to PRIMARY. Default value is PRIMARY. Possible values are: PRIMARY, SECONDARY | `string` | `"PRIMARY"` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The database engine major version. This is an optional field and it's populated at the Cluster creation time. Note: Changing this field to a higer version results in upgrading the AlloyDB cluster which is an irreversible change. | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | User-settable and human-readable display name for the Cluster. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to backups created using this configuration. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the alloydb cluster should reside. | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: 'projects/{projectNumber}/global/networks/{network\_id}'. | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | The initial password for the user. | `string` | `null` | no |
| <a name="input_primary_cluster_name"></a> [primary\_cluster\_name](#input\_primary\_cluster\_name) | The name of the primary cluster. This field is used to specify the primary cluster for a secondary cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster\_id}' | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| <a name="input_skip_await_major_version_upgrade"></a> [skip\_await\_major\_version\_upgrade](#input\_skip\_await\_major\_version\_upgrade) | Set to true to skip awaiting on the major version upgrade of the cluster. | `bool` | `null` | no |
| <a name="input_subscription_type"></a> [subscription\_type](#input\_subscription\_type) | The subscription type of cluster. Possible values are: TRIAL, STANDARD. Default value is STANDARD. | `string` | `"STANDARD"` | no |
| <a name="input_user"></a> [user](#input\_user) | The initial user's database username. Default is 'postgres'. | `string` | `"postgres"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Google AlloyDB for PostgreSQL cluster |
<!-- END_TF_DOCS -->