# onboard-aws-redshift-odbc
Onboard Amazon Redshift (via ODBC) to DSF Hub.

## Notes
There is one prerequisite for using this module:
1. A method to create an audit pull user on the Redshift cluster.

See the corresponding example for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_redshift-asset"></a> [redshift-asset](#module\_redshift-asset)

Source: ../dsfhub-aws-redshift-cluster

Version:

### <a name="module_redshift-cluster"></a> [redshift-cluster](#module\_redshift-cluster)

Source: ../aws-redshift-cluster

Version:

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_aws_redshift_admin_email"></a> [aws\_redshift\_admin\_email](#input\_aws\_redshift\_admin\_email)

Description: The email address to notify about the Redshift asset

Type: `string`

### <a name="input_aws_redshift_gateway_id"></a> [aws\_redshift\_gateway\_id](#input\_aws\_redshift\_gateway\_id)

Description: Unique identifier (UID) attached to the jSonar machine controlling the Redshift asset

Type: `string`

### <a name="input_aws_redshift_password"></a> [aws\_redshift\_password](#input\_aws\_redshift\_password)

Description: The password for the Redshift cluster.

Type: `string`

### <a name="input_aws_redshift_region"></a> [aws\_redshift\_region](#input\_aws\_redshift\_region)

Description: AWS region containing the Redshift cluster.

Type: `string`

### <a name="input_aws_redshift_username"></a> [aws\_redshift\_username](#input\_aws\_redshift\_username)

Description: The username for the Redshift cluster.

Type: `string`

### <a name="input_redshift_cluster_identifier"></a> [redshift\_cluster\_identifier](#input\_redshift\_cluster\_identifier)

Description: Identifier of the Redshift cluster. Must be a lower case string.

Type: `string`

### <a name="input_redshift_master_password"></a> [redshift\_master\_password](#input\_redshift\_master\_password)

Description: The password for the master database user. Must contain at least 8 characters and contain at least one uppercase letter, one lowercase letter, and one number.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_redshift_audit_pull_enabled"></a> [aws\_redshift\_audit\_pull\_enabled](#input\_aws\_redshift\_audit\_pull\_enabled)

Description: A boolean that indicates if the asset should be audited.

Type: `bool`

Default: `false`

### <a name="input_aws_redshift_parent_asset_id"></a> [aws\_redshift\_parent\_asset\_id](#input\_aws\_redshift\_parent\_asset\_id)

Description: The asset\_id of AWS cloud account being used. E.g. Key-pair, iam\_role, profile or default

Type: `string`

Default: `null`

### <a name="input_aws_redshift_ssl"></a> [aws\_redshift\_ssl](#input\_aws\_redshift\_ssl)

Description: Whether to use SSL for the connection.

Type: `bool`

Default: `null`

### <a name="input_redshift_apply_immediately"></a> [redshift\_apply\_immediately](#input\_redshift\_apply\_immediately)

Description: A boolean that indicates whether major version upgrades are applied immediately, regardless of the maintenance window.

Type: `bool`

Default: `true`

### <a name="input_redshift_cluster_subnet_group_name"></a> [redshift\_cluster\_subnet\_group\_name](#input\_redshift\_cluster\_subnet\_group\_name)

Description: The name of a cluster subnet group to be associated with this cluster.

Type: `string`

Default: `null`

### <a name="input_redshift_cluster_type"></a> [redshift\_cluster\_type](#input\_redshift\_cluster\_type)

Description: The type of the cluster. Valid values: single-node | multi-node.

Type: `string`

Default: `"single-node"`

### <a name="input_redshift_cluster_version"></a> [redshift\_cluster\_version](#input\_redshift\_cluster\_version)

Description: The version of the Amazon Redshift engine software that you want to deploy on the cluster.

Type: `string`

Default: `"1.0"`

### <a name="input_redshift_database_name"></a> [redshift\_database\_name](#input\_redshift\_database\_name)

Description: The name of the first database to be created when the cluster is created.

Type: `string`

Default: `"dev"`

### <a name="input_redshift_default_iam_role_arn"></a> [redshift\_default\_iam\_role\_arn](#input\_redshift\_default\_iam\_role\_arn)

Description: The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster when the cluster was created.

Type: `string`

Default: `null`

### <a name="input_redshift_elastic_ip"></a> [redshift\_elastic\_ip](#input\_redshift\_elastic\_ip)

Description: The Elastic IP (EIP) address for the cluster.

Type: `string`

Default: `null`

### <a name="input_redshift_final_snapshot_identifier"></a> [redshift\_final\_snapshot\_identifier](#input\_redshift\_final\_snapshot\_identifier)

Description: The identifier of the final snapshot that is to be created immediately before deleting the cluster.

Type: `string`

Default: `null`

### <a name="input_redshift_iam_roles"></a> [redshift\_iam\_roles](#input\_redshift\_iam\_roles)

Description: A list of IAM roles to associate with the cluster. A maximum of 10 IAM roles can be associated to the cluster at any time.

Type: `list(string)`

Default: `null`

### <a name="input_redshift_master_username"></a> [redshift\_master\_username](#input\_redshift\_master\_username)

Description: The username for the master database user.

Type: `string`

Default: `"admin"`

### <a name="input_redshift_node_type"></a> [redshift\_node\_type](#input\_redshift\_node\_type)

Description: The node type to be provisioned for the cluster.

Type: `string`

Default: `"dc2.large"`

### <a name="input_redshift_number_of_nodes"></a> [redshift\_number\_of\_nodes](#input\_redshift\_number\_of\_nodes)

Description: The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node.

Type: `number`

Default: `1`

### <a name="input_redshift_port"></a> [redshift\_port](#input\_redshift\_port)

Description: The port number on which the cluster accepts incoming connections. Valid values are between 1115 and 65535

Type: `number`

Default: `5439`

### <a name="input_redshift_preferred_maintenance_window"></a> [redshift\_preferred\_maintenance\_window](#input\_redshift\_preferred\_maintenance\_window)

Description: The weekly time range (in UTC) during which automated cluster maintenance can occur.

Type: `string`

Default: `null`

### <a name="input_redshift_publicly_accessible"></a> [redshift\_publicly\_accessible](#input\_redshift\_publicly\_accessible)

Description: A boolean that indicates if the cluster is publicly accessible. If the value is true, the cluster can be accessed from a public network.

Type: `bool`

Default: `true`

### <a name="input_redshift_skip_final_snapshot"></a> [redshift\_skip\_final\_snapshot](#input\_redshift\_skip\_final\_snapshot)

Description: A boolean that indicates whether a final snapshot is created before the cluster is deleted.

Type: `bool`

Default: `true`

### <a name="input_redshift_snapshot_cluster_identifier"></a> [redshift\_snapshot\_cluster\_identifier](#input\_redshift\_snapshot\_cluster\_identifier)

Description: The name of the cluster the source snapshot was created from.

Type: `string`

Default: `null`

### <a name="input_redshift_snapshot_identifier"></a> [redshift\_snapshot\_identifier](#input\_redshift\_snapshot\_identifier)

Description: The name of the snapshot from which to create the new cluster

Type: `string`

Default: `null`

### <a name="input_redshift_tags"></a> [redshift\_tags](#input\_redshift\_tags)

Description: A map of tags to assign to the resource.

Type: `map(string)`

Default: `null`

### <a name="input_redshift_vpc_security_group_ids"></a> [redshift\_vpc\_security\_group\_ids](#input\_redshift\_vpc\_security\_group\_ids)

Description: A list of security group identifiers to associate with this cluster.

Type: `list(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_redshift-asset"></a> [redshift-asset](#output\_redshift-asset)

Description: aws redshift asset

### <a name="output_redshift-cluster"></a> [redshift-cluster](#output\_redshift-cluster)

Description: redshift cluster
<!-- END_TF_DOCS -->