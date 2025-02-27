# onboard-gcp-spanner

Onboard GCP Spanner to DSF Hub.

## Notes
There are three prerequisites for using this module:
1. A Google Service Account with permissions to read from PubSub subscriptions.
2. Data Access logs to be enabled for the Spanner API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions.
3. A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF Hub.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-spanner-asset"></a> [gcp-spanner-asset](#module\_gcp-spanner-asset) | ../dsfhub-gcp-spanner | n/a |
| <a name="module_gcp-spanner-instance"></a> [gcp-spanner-instance](#module\_gcp-spanner-instance) | ../google-spanner-instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_spanner_admin_email"></a> [gcp\_spanner\_admin\_email](#input\_gcp\_spanner\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_spanner_audit_pull_enabled"></a> [gcp\_spanner\_audit\_pull\_enabled](#input\_gcp\_spanner\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_gcp_spanner_duration_threshold"></a> [gcp\_spanner\_duration\_threshold](#input\_gcp\_spanner\_duration\_threshold) | How long (in seconds) a query's execution may take until it is flagged as slow. | `number` | `null` | no |
| <a name="input_gcp_spanner_gateway_id"></a> [gcp\_spanner\_gateway\_id](#input\_gcp\_spanner\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_spanner_logs_destination_asset_id"></a> [gcp\_spanner\_logs\_destination\_asset\_id](#input\_gcp\_spanner\_logs\_destination\_asset\_id) | The asset\_id of the GCP PUSUB asset that this asset is sending its audit logs to. | `string` | `null` | no |
| <a name="input_gcp_spanner_parent_asset_id"></a> [gcp\_spanner\_parent\_asset\_id](#input\_gcp\_spanner\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |
| <a name="input_instance_config"></a> [instance\_config](#input\_instance\_config) | The name of the instance's configuration (similar but not quite the same as a region) which defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc. In order to obtain a valid list please consult the [Configuration section of the docs](https://cloud.google.com/spanner/docs/instances) or run `gcloud spanner instance-configs list`. | `string` | `null` | no |
| <a name="input_instance_display_name"></a> [instance\_display\_name](#input\_instance\_display\_name) | The descriptive name for this instance as it appears in UIs. | `string` | `null` | no |
| <a name="input_instance_edition"></a> [instance\_edition](#input\_instance\_edition) | The edition selected for this instance. Different editions provide different capabilities at different price points. Possible values are: EDITION\_UNSPECIFIED, STANDARD, ENTERPRISE, ENTERPRISE\_PLUS. | `string` | `"STANDARD"` | no |
| <a name="input_instance_labels"></a> [instance\_labels](#input\_instance\_labels) | An object containing a list of key/value pairs. | `map(string)` | `{}` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | A unique identifier for the instance, which cannot be changed after the instance is created. If not provided, a random string starting with `tf-` will be selected. | `string` | n/a | yes |
| <a name="input_instance_num_nodes"></a> [instance\_num\_nodes](#input\_instance\_num\_nodes) | The number of nodes allocated to this instance. Exactly one of either node\_count or processing\_units must be present in terraform. | `number` | `1` | no |
| <a name="input_instance_project"></a> [instance\_project](#input\_instance\_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp-spanner-asset"></a> [gcp-spanner-asset](#output\_gcp-spanner-asset) | GCP SPANNER asset |
| <a name="output_gcp-spanner-instance"></a> [gcp-spanner-instance](#output\_gcp-spanner-instance) | Google Spanner instance |
<!-- END_TF_DOCS -->