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
| [google_alloydb_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_range"></a> [cidr\_range](#input\_cidr\_range) | CIDR range for one authorized network of the instance. | `string` | `null` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster\_id}'. | `string` | n/a | yes |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | List of database flags to assign to the instance. | `map(string)` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | User-settable and human-readable display name for the Instance. | `string` | n/a | yes |
| <a name="input_enable_outbound_public_ip"></a> [enable\_outbound\_public\_ip](#input\_enable\_outbound\_public\_ip) | Whether to enable outbound public IP for the instance. Default is true. | `bool` | `null` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance. Default is true. | `bool` | `null` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | The ID of the alloydb instance. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of the instance. If the instance type is READ\_POOL, provide the associated PRIMARY/SECONDARY instance in the depends\_on meta-data attribute. If the instance type is SECONDARY, point to the cluster\_type of the associated secondary cluster instead of mentioning SECONDARY. Example: {instance\_type = google\_alloydb\_cluster..cluster\_type} instead of {instance\_type = SECONDARY} If the instance type is SECONDARY, the terraform delete instance operation does not delete the secondary instance but abandons it instead. Use deletion\_policy = "FORCE" in the associated secondary cluster and delete the cluster forcefully to delete the secondary cluster as well its associated secondary instance. Users can undo the delete secondary instance action by importing the deleted secondary instance by calling terraform import. Possible values are: PRIMARY, READ\_POOL, SECONDARY. | `string` | `"PRIMARY"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to this instance. | `map(string)` | `{}` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of nodes in the read pool. This field is required for READ\_POOL instance type. | `number` | `null` | no |
| <a name="input_ssl_mode"></a> [ssl\_mode](#input\_ssl\_mode) | SSL mode. Specifies client-server SSL/TLS connection behavior. Possible values are: ENCRYPTED\_ONLY, ALLOW\_UNENCRYPTED\_AND\_ENCRYPTED. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Google AlloyDB for PostgreSQL instance |
<!-- END_TF_DOCS -->