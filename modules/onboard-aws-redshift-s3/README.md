# onboard-aws-redshift-s3
Onboard Amazon Redshift (via S3 Bucket) to DSF Hub.

## Notes
There is one prerequisite for using this module:
1. An AWS cloud account asset onboarded to your DSF Hub with permissions to pull from S3 buckets.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_redshift-asset"></a> [redshift-asset](#module\_redshift-asset) | ../dsfhub-aws-redshift-cluster | n/a |
| <a name="module_redshift-cluster"></a> [redshift-cluster](#module\_redshift-cluster) | ../aws-redshift-cluster | n/a |
| <a name="module_redshift-logging"></a> [redshift-logging](#module\_redshift-logging) | ../aws-redshift-logging | n/a |
| <a name="module_redshift-parameter-group"></a> [redshift-parameter-group](#module\_redshift-parameter-group) | ../aws-redshift-parameter-group | n/a |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | ../aws-s3-bucket | n/a |
| <a name="module_s3-bucket-asset"></a> [s3-bucket-asset](#module\_s3-bucket-asset) | ../dsfhub-aws-s3-bucket-la | n/a |
| <a name="module_s3-bucket-policy"></a> [s3-bucket-policy](#module\_s3-bucket-policy) | ../aws-s3-bucket-policy | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_redshift_admin_email"></a> [aws\_redshift\_admin\_email](#input\_aws\_redshift\_admin\_email) | The email address to notify about the Redshift asset | `string` | n/a | yes |
| <a name="input_aws_redshift_audit_pull_enabled"></a> [aws\_redshift\_audit\_pull\_enabled](#input\_aws\_redshift\_audit\_pull\_enabled) | A boolean that indicates if the asset should be audited. | `bool` | `true` | no |
| <a name="input_aws_redshift_bucket_account_id"></a> [aws\_redshift\_bucket\_account\_id](#input\_aws\_redshift\_bucket\_account\_id) | The account\_id of the bucket owner | `string` | n/a | yes |
| <a name="input_aws_redshift_gateway_id"></a> [aws\_redshift\_gateway\_id](#input\_aws\_redshift\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the Redshift asset | `string` | n/a | yes |
| <a name="input_aws_redshift_parent_asset_id"></a> [aws\_redshift\_parent\_asset\_id](#input\_aws\_redshift\_parent\_asset\_id) | The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default | `string` | `null` | no |
| <a name="input_aws_redshift_region"></a> [aws\_redshift\_region](#input\_aws\_redshift\_region) | AWS region containing the Redshift cluster. | `string` | n/a | yes |
| <a name="input_aws_s3_admin_email"></a> [aws\_s3\_admin\_email](#input\_aws\_s3\_admin\_email) | The email address to notify about the S3 asset | `string` | n/a | yes |
| <a name="input_aws_s3_asset_display_name"></a> [aws\_s3\_asset\_display\_name](#input\_aws\_s3\_asset\_display\_name) | User-friendly name of the asset, defined by the user | `string` | n/a | yes |
| <a name="input_aws_s3_audit_pull_enabled"></a> [aws\_s3\_audit\_pull\_enabled](#input\_aws\_s3\_audit\_pull\_enabled) | A boolean that indicates if the asset should be audited. | `bool` | `true` | no |
| <a name="input_aws_s3_bucket_account_id"></a> [aws\_s3\_bucket\_account\_id](#input\_aws\_s3\_bucket\_account\_id) | The account\_id of the bucket owner | `string` | `null` | no |
| <a name="input_aws_s3_gateway_id"></a> [aws\_s3\_gateway\_id](#input\_aws\_s3\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the S3 asset | `string` | n/a | yes |
| <a name="input_aws_s3_parent_asset_id"></a> [aws\_s3\_parent\_asset\_id](#input\_aws\_s3\_parent\_asset\_id) | The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default | `string` | n/a | yes |
| <a name="input_aws_s3_region"></a> [aws\_s3\_region](#input\_aws\_s3\_region) | AWS region containing the S3 bucket. | `string` | n/a | yes |
| <a name="input_aws_s3_server_port"></a> [aws\_s3\_server\_port](#input\_aws\_s3\_server\_port) | Port used by the source server. Default: 443 | `number` | `443` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | The description of the Redshift parameter group. | `string` | `null` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | The family of the Redshift parameter group. | `string` | `"redshift-1.0"` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the Redshift parameter group. | `string` | n/a | yes |
| <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters) | A list of Redshift parameters to apply. | <pre>list(<br>    object({<br>      name  = string<br>      value = any<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "name": "enable_user_activity_logging",<br>    "value": "true"<br>  }<br>]</pre> | no |
| <a name="input_parameter_group_tags"></a> [parameter\_group\_tags](#input\_parameter\_group\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_redshift_apply_immediately"></a> [redshift\_apply\_immediately](#input\_redshift\_apply\_immediately) | A boolean that indicates whether major version upgrades are applied immediately, regardless of the maintenance window. | `bool` | `true` | no |
| <a name="input_redshift_cluster_identifier"></a> [redshift\_cluster\_identifier](#input\_redshift\_cluster\_identifier) | Identifier of the Redshift cluster. Must be a lower case string. | `string` | n/a | yes |
| <a name="input_redshift_cluster_parameter_group_name"></a> [redshift\_cluster\_parameter\_group\_name](#input\_redshift\_cluster\_parameter\_group\_name) | The name of the parameter group to be associated with this cluster. | `string` | `null` | no |
| <a name="input_redshift_cluster_subnet_group_name"></a> [redshift\_cluster\_subnet\_group\_name](#input\_redshift\_cluster\_subnet\_group\_name) | The name of a cluster subnet group to be associated with this cluster. | `string` | `null` | no |
| <a name="input_redshift_cluster_type"></a> [redshift\_cluster\_type](#input\_redshift\_cluster\_type) | The type of the cluster. Valid values: single-node \| multi-node. | `string` | `"single-node"` | no |
| <a name="input_redshift_cluster_version"></a> [redshift\_cluster\_version](#input\_redshift\_cluster\_version) | The version of the Amazon Redshift engine software that you want to deploy on the cluster. | `string` | `"1.0"` | no |
| <a name="input_redshift_database_name"></a> [redshift\_database\_name](#input\_redshift\_database\_name) | The name of the first database to be created when the cluster is created. | `string` | `"dev"` | no |
| <a name="input_redshift_default_iam_role_arn"></a> [redshift\_default\_iam\_role\_arn](#input\_redshift\_default\_iam\_role\_arn) | The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the cluster was created. | `string` | `null` | no |
| <a name="input_redshift_elastic_ip"></a> [redshift\_elastic\_ip](#input\_redshift\_elastic\_ip) | The Elastic IP (EIP) address for the cluster. | `string` | `null` | no |
| <a name="input_redshift_final_snapshot_identifier"></a> [redshift\_final\_snapshot\_identifier](#input\_redshift\_final\_snapshot\_identifier) | The identifier of the final snapshot that is to be created immediately before deleting the cluster. | `string` | `null` | no |
| <a name="input_redshift_iam_roles"></a> [redshift\_iam\_roles](#input\_redshift\_iam\_roles) | A list of IAM roles to associate with the cluster. A maximum of 10 IAM roles can be associated to the cluster at any time. | `list(string)` | `null` | no |
| <a name="input_redshift_master_password"></a> [redshift\_master\_password](#input\_redshift\_master\_password) | The password for the master database user. Must contain at least 8 characters and contain at least one uppercase letter, one lowercase letter, and one number. | `string` | n/a | yes |
| <a name="input_redshift_master_username"></a> [redshift\_master\_username](#input\_redshift\_master\_username) | The username for the master database user. | `string` | `"admin"` | no |
| <a name="input_redshift_node_type"></a> [redshift\_node\_type](#input\_redshift\_node\_type) | The node type to be provisioned for the cluster. | `string` | `"dc2.large"` | no |
| <a name="input_redshift_number_of_nodes"></a> [redshift\_number\_of\_nodes](#input\_redshift\_number\_of\_nodes) | The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node. | `number` | `1` | no |
| <a name="input_redshift_port"></a> [redshift\_port](#input\_redshift\_port) | The port number on which the cluster accepts incoming connections. Valid values are between 1115 and 65535 | `number` | `5439` | no |
| <a name="input_redshift_preferred_maintenance_window"></a> [redshift\_preferred\_maintenance\_window](#input\_redshift\_preferred\_maintenance\_window) | The weekly time range (in UTC) during which automated cluster maintenance can occur. | `string` | `null` | no |
| <a name="input_redshift_publicly_accessible"></a> [redshift\_publicly\_accessible](#input\_redshift\_publicly\_accessible) | A boolean that indicates if the cluster is publicly accessible. If the value is true, the cluster can be accessed from a public network. | `bool` | `true` | no |
| <a name="input_redshift_skip_final_snapshot"></a> [redshift\_skip\_final\_snapshot](#input\_redshift\_skip\_final\_snapshot) | A boolean that indicates whether a final snapshot is created before the cluster is deleted. | `bool` | `true` | no |
| <a name="input_redshift_snapshot_cluster_identifier"></a> [redshift\_snapshot\_cluster\_identifier](#input\_redshift\_snapshot\_cluster\_identifier) | The name of the cluster the source snapshot was created from. | `string` | `null` | no |
| <a name="input_redshift_snapshot_identifier"></a> [redshift\_snapshot\_identifier](#input\_redshift\_snapshot\_identifier) | The name of the snapshot from which to create the new cluster | `string` | `null` | no |
| <a name="input_redshift_tags"></a> [redshift\_tags](#input\_redshift\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_redshift_vpc_security_group_ids"></a> [redshift\_vpc\_security\_group\_ids](#input\_redshift\_vpc\_security\_group\_ids) | A list of security group identifiers to associate with this cluster. | `list(string)` | `null` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The name of the bucket. Must be lowercase and less than or equal to 63 characters in length. | `string` | n/a | yes |
| <a name="input_s3_force_destroy"></a> [s3\_force\_destroy](#input\_s3\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the (aws terraform documentation)[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy]. | `bool` | `false` | no |
| <a name="input_s3_object_lock_enabled"></a> [s3\_object\_lock\_enabled](#input\_s3\_object\_lock\_enabled) | A boolean that indicates whether this bucket should have an Object Lock configuration enabled. | `bool` | `false` | no |
| <a name="input_s3_tags"></a> [s3\_tags](#input\_s3\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redshift-asset"></a> [redshift-asset](#output\_redshift-asset) | aws redshift asset |
| <a name="output_redshift-cluster"></a> [redshift-cluster](#output\_redshift-cluster) | redshift cluster |
| <a name="output_redshift-logging"></a> [redshift-logging](#output\_redshift-logging) | redshift logging configuration |
| <a name="output_redshift-parameter-group"></a> [redshift-parameter-group](#output\_redshift-parameter-group) | redshift parameter group |
| <a name="output_s3-bucket"></a> [s3-bucket](#output\_s3-bucket) | s3 bucket |
| <a name="output_s3-bucket-asset"></a> [s3-bucket-asset](#output\_s3-bucket-asset) | aws s3 bucket asset |
| <a name="output_s3-bucket-policy"></a> [s3-bucket-policy](#output\_s3-bucket-policy) | s3 bucket policy |
| <a name="output_s3_policy"></a> [s3\_policy](#output\_s3\_policy) | s3 iam policy |
<!-- END_TF_DOCS -->