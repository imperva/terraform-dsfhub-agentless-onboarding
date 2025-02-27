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
| [google_spanner_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | The name of the instance's configuration (similar but not quite the same as a region) which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc. In order to obtain a valid list please consult the [Configuration section of the docs](https://cloud.google.com/spanner/docs/instances) or run `gcloud spanner instance-configs list`. | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The descriptive name for this instance as it appears in UIs. | `string` | `null` | no |
| <a name="input_edition"></a> [edition](#input\_edition) | The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: EDITION\_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE\_PLUS. | `string` | `"STANDARD"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | An object containing a list of key/value pairs. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique identifier for the instance, which cannot be changed after the instance is created. If not provided, a random string starting with `tf-` will be selected. | `string` | n/a | yes |
| <a name="input_num_nodes"></a> [num\_nodes](#input\_num\_nodes) | The number of nodes allocated to this instance. Exactly one of either node\_count or processing\_units must be present in terraform. Default is 1. | `number` | `1` | no |
| <a name="input_processing_units"></a> [processing\_units](#input\_processing\_units) | The number of processing units allocated to this instance. Exactly one of either node\_count or processing\_units must be present in terraform. | `number` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Google Spanner instance |
<!-- END_TF_DOCS -->