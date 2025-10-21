# onboard-gcp-cloud-storage-bucket
Creates and onboards a Google Cloud Storage service bucket to DSF Hub.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-cloud-storage-bucket-asset"></a> [gcp-cloud-storage-bucket-asset](#module\_gcp-cloud-storage-bucket-asset) | ../dsfhub-gcp-cloud-storage-bucket | n/a |
| <a name="module_gcs-bucket"></a> [gcs-bucket](#module\_gcs-bucket) | ../google-storage-bucket | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_force_destroy"></a> [bucket\_force\_destroy](#input\_bucket\_force\_destroy) | When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. Defaults to false. | `bool` | `false` | no |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | The [GCS location](https://cloud.google.com/storage/docs/locations). | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket | `string` | n/a | yes |
| <a name="input_bucket_project"></a> [bucket\_project](#input\_bucket\_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | `null` | no |
| <a name="input_bucket_storage_class"></a> [bucket\_storage\_class](#input\_bucket\_storage\_class) | The [Storage Class](https://cloud.google.com/storage/docs/storage-classes) of the new bucket. | `string` | `"STANDARD"` | no |
| <a name="input_gcp_cloud_storage_bucket_admin_email"></a> [gcp\_cloud\_storage\_bucket\_admin\_email](#input\_gcp\_cloud\_storage\_bucket\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_cloud_storage_bucket_audit_data_type"></a> [gcp\_cloud\_storage\_bucket\_audit\_data\_type](#input\_gcp\_cloud\_storage\_bucket\_audit\_data\_type) | The type of audit data to pull from the bucket. Relevant for audit\_types PUBSUB and PUBSUB\_SLOW. Accepted values are: ALLOYDB\_POSTGRESQL, POSTGRESQL, BIGTABLE, BIGQUERY, MSSQL, MYSQL, MYSQL\_SLOW\_QUERY, SPANNER. | `string` | `null` | no |
| <a name="input_gcp_cloud_storage_bucket_audit_pull_enabled"></a> [gcp\_cloud\_storage\_bucket\_audit\_pull\_enabled](#input\_gcp\_cloud\_storage\_bucket\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `null` | no |
| <a name="input_gcp_cloud_storage_bucket_audit_type"></a> [gcp\_cloud\_storage\_bucket\_audit\_type](#input\_gcp\_cloud\_storage\_bucket\_audit\_type) | Defines the type of audit used by DSF. In this case, where the audit files are stored. Accepted values are: PUBSUB, PUBSUB\_SLOW, BUCKET. Defaults to BUCKET. | `string` | `"BUCKET"` | no |
| <a name="input_gcp_cloud_storage_bucket_content_type"></a> [gcp\_cloud\_storage\_bucket\_content\_type](#input\_gcp\_cloud\_storage\_bucket\_content\_type) | Content type should be set to the desired <'parent' asset "Server Type">, which is the one that uses this asset as a destination for logs. | `string` | `null` | no |
| <a name="input_gcp_cloud_storage_bucket_gateway_id"></a> [gcp\_cloud\_storage\_bucket\_gateway\_id](#input\_gcp\_cloud\_storage\_bucket\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_cloud_storage_bucket_parent_asset_id"></a> [gcp\_cloud\_storage\_bucket\_parent\_asset\_id](#input\_gcp\_cloud\_storage\_bucket\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp-cloud-storage-bucket-asset"></a> [gcp-cloud-storage-bucket-asset](#output\_gcp-cloud-storage-bucket-asset) | GCP CLOUD STORAGE BUCKET asset. |
| <a name="output_gcs-bucket"></a> [gcs-bucket](#output\_gcs-bucket) | Google Cloud Storage Service bucket. |
<!-- END_TF_DOCS -->