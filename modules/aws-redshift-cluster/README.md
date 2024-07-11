<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_redshift_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Identifier of the Redshift cluster. Must be a lower case string. | `string` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | The password for the master database user. Must contain at least 8 characters and contain at least one uppercase letter, one lowercase letter, and one number. | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | A boolean that indicates whether major version upgrades are applied immediately, regardless of the maintenance window. | `bool` | `true` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | The name of the parameter group to be associated with this cluster. | `string` | `null` | no |
| <a name="input_cluster_subnet_group_name"></a> [cluster\_subnet\_group\_name](#input\_cluster\_subnet\_group\_name) | The name of a cluster subnet group to be associated with this cluster. | `string` | `null` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of the cluster. Valid values: single-node \| multi-node. | `string` | `"single-node"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of the Amazon Redshift engine software that you want to deploy on the cluster. | `string` | `"1.0"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the first database to be created when the cluster is created. | `string` | `"dev"` | no |
| <a name="input_default_iam_role_arn"></a> [default\_iam\_role\_arn](#input\_default\_iam\_role\_arn) | The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the cluster was created. | `string` | `null` | no |
| <a name="input_elastic_ip"></a> [elastic\_ip](#input\_elastic\_ip) | The Elastic IP (EIP) address for the cluster. | `string` | `null` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The identifier of the final snapshot that is to be created immediately before deleting the cluster. | `string` | `null` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | A list of IAM roles to associate with the cluster. A maximum of 10 IAM roles can be associated to the cluster at any time. | `list(string)` | `null` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | The username for the master database user. | `string` | `"admin"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The node type to be provisioned for the cluster. | `string` | `"dc2.large"` | no |
| <a name="input_number_of_nodes"></a> [number\_of\_nodes](#input\_number\_of\_nodes) | The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node. | `number` | `1` | no |
| <a name="input_port"></a> [port](#input\_port) | The port number on which the cluster accepts incoming connections. Valid values are between 1115 and 65535 | `number` | `5439` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | The weekly time range (in UTC) during which automated cluster maintenance can occur. | `string` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | A boolean that indicates if the cluster is publicly accessible. If the value is true, the cluster can be accessed from a public network. | `bool` | `true` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | A boolean that indicates whether a final snapshot is created before the cluster is deleted. | `bool` | `true` | no |
| <a name="input_snapshot_cluster_identifier"></a> [snapshot\_cluster\_identifier](#input\_snapshot\_cluster\_identifier) | The name of the cluster the source snapshot was created from. | `string` | `null` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | The name of the snapshot from which to create the new cluster | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of security group identifiers to associate with this cluster. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | AWS Redshift Cluster |
<!-- END_TF_DOCS -->