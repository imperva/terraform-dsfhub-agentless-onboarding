<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dsfhub"></a> [dsfhub](#provider\_dsfhub) | >= 1.3.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [dsfhub_log_aggregator.this](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs/resources/log_aggregator) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_asset_display_name"></a> [asset\_display\_name](#input\_asset\_display\_name) | User-friendly name of the asset, defined by user | `string` | n/a | yes |
| <a name="input_asset_id"></a> [asset\_id](#input\_asset\_id) | Alibaba log store ARN | `string` | n/a | yes |
| <a name="input_audit_data_type"></a> [audit\_data\_type](#input\_audit\_data\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `null` | no |
| <a name="input_audit_pull_enabled"></a> [audit\_pull\_enabled](#input\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_audit_type"></a> [audit\_type](#input\_audit\_type) | Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details | `string` | `null` | no |
| <a name="input_consumer_group"></a> [consumer\_group](#input\_consumer\_group) | The name of the consumer group to use for the pull. Only applies to pull\_type: consumer\_group. Version 4.19+ | `string` | `null` | no |
| <a name="input_consumer_group_workers"></a> [consumer\_group\_workers](#input\_consumer\_group\_workers) | The number of workers. Has to be an integer between 1 and 64 (inclusive). We also support the string "dynamic" which will automatically retrieve the number of shards and set the workers to that number. Defaults to 2. | `string` | `"2"` | no |
| <a name="input_consumer_worker_prefix"></a> [consumer\_worker\_prefix](#input\_consumer\_worker\_prefix) | The prefix to use for the consumer group workers. By default the name of the consumer group is used. Version 4.19+. | `string` | `null` | no |
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | When combined with "content\_type" field, it accepts all the "audit\_type" fields allowed by the 'parent' asset server\_type. Defaults to the associated db asset. | `string` | `null` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The endpoint of the Logstore. | `string` | n/a | yes |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'. | `string` | n/a | yes |
| <a name="input_logstore"></a> [logstore](#input\_logstore) | The name of the Logstore. | `string` | n/a | yes |
| <a name="input_parent_asset_id"></a> [parent\_asset\_id](#input\_parent\_asset\_id) | The asset\_id that contains this asset (e.g. Asset ID of the database sending audit events). The parent must either be an AWS account, or have a parent which is an AWS account. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project separates different resources of multiple users and control access to specific resources. | `string` | n/a | yes |
| <a name="input_pull_type"></a> [pull\_type](#input\_pull\_type) | The method used to pull data from the logstore. Possible values: "log\_client", "consumer\_group". Defaults to "log\_client". | `string` | `"log_client"` | no |
| <a name="input_region"></a> [region](#input\_region) | Alibaba region of the log store | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | Alibaba Log Store asset |
<!-- END_TF_DOCS -->