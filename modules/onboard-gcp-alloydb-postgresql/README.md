# onboard-gcp-alloydb-postgresql

Onboard Google ALloyDB for PostgreSQL to DSF Hub.

## Notes
There are five prerequisites for using this module:
1. The user or service account running the module will require the AlloyDB Admin role for configuring the cluster(s) including modifying database flags.
2. A Google Service Account with permissions to read from PubSub subscriptions.
3. Data Access logs to be enabled for the AlloyDB API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions.
4. A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF Hub.
5. A method to create the 'pgaudit' extension on the postgres instance.

See the corresponding example for more details.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.7 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-alloydb-cluster"></a> [gcp-alloydb-cluster](#module\_gcp-alloydb-cluster) | ../google-alloydb-cluster | n/a |
| <a name="module_gcp-alloydb-postgresql-asset"></a> [gcp-alloydb-postgresql-asset](#module\_gcp-alloydb-postgresql-asset) | ../dsfhub-gcp-alloydb-postgresql | n/a |
| <a name="module_gcp-alloydb-postgresql-cluster-asset"></a> [gcp-alloydb-postgresql-cluster-asset](#module\_gcp-alloydb-postgresql-cluster-asset) | ../dsfhub-gcp-alloydb-postgresql-cluster | n/a |
| <a name="module_gcp-alloydb-primary-instance"></a> [gcp-alloydb-primary-instance](#module\_gcp-alloydb-primary-instance) | ../google-alloydb-instance | n/a |
| <a name="module_gcp-alloydb-read-pool-instance"></a> [gcp-alloydb-read-pool-instance](#module\_gcp-alloydb-read-pool-instance) | ../google-alloydb-instance | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_allocated_ip_range"></a> [cluster\_allocated\_ip\_range](#input\_cluster\_allocated\_ip\_range) | The name of the allocated IP range for the private IP AlloyDB cluster. For example: 'google-managed-services-default'. If set, the instance IPs for this cluster will be created in the allocated range. | `string` | `null` | no |
| <a name="input_cluster_database_version"></a> [cluster\_database\_version](#input\_cluster\_database\_version) | The database engine major version. This is an optional field and it's populated at the Cluster creation time. Note: Changing this field to a higer version results in upgrading the AlloyDB cluster which is an irreversible change. Default is 'POSTGRES\_15'. | `string` | `"POSTGRES_15"` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the AlloyDB cluster. | `string` | n/a | yes |
| <a name="input_cluster_labels"></a> [cluster\_labels](#input\_cluster\_labels) | Labels to apply to backups created using this configuration. | `map(string)` | `{}` | no |
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | The location where the AlloyDB cluster should reside. | `string` | n/a | yes |
| <a name="input_cluster_network"></a> [cluster\_network](#input\_cluster\_network) | The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: 'projects/{projectNumber}/global/networks/{network\_id}'. | `string` | `null` | no |
| <a name="input_cluster_password"></a> [cluster\_password](#input\_cluster\_password) | The password for the initial user. | `string` | `null` | no |
| <a name="input_cluster_project"></a> [cluster\_project](#input\_cluster\_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| <a name="input_cluster_subscription_type"></a> [cluster\_subscription\_type](#input\_cluster\_subscription\_type) | The subscription type of cluster. Possible values are: TRIAL, STANDARD. Default value is STANDARD. | `string` | `"STANDARD"` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of cluster. If not set, defaults to PRIMARY. Default value is PRIMARY. Possible values are: PRIMARY, SECONDARY | `string` | `"PRIMARY"` | no |
| <a name="input_cluster_user"></a> [cluster\_user](#input\_cluster\_user) | The initial user for the cluster. Default is 'postgres'. | `string` | `"postgres"` | no |
| <a name="input_gcp_alloydb_postgresql_admin_email"></a> [gcp\_alloydb\_postgresql\_admin\_email](#input\_gcp\_alloydb\_postgresql\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_alloydb_postgresql_cluster_admin_email"></a> [gcp\_alloydb\_postgresql\_cluster\_admin\_email](#input\_gcp\_alloydb\_postgresql\_cluster\_admin\_email) | The email address to notify about the asset. | `string` | n/a | yes |
| <a name="input_gcp_alloydb_postgresql_cluster_audit_pull_enabled"></a> [gcp\_alloydb\_postgresql\_cluster\_audit\_pull\_enabled](#input\_gcp\_alloydb\_postgresql\_cluster\_audit\_pull\_enabled) | If true, sonargateway will collect the audit logs for this system if it can. | `bool` | `false` | no |
| <a name="input_gcp_alloydb_postgresql_cluster_gateway_id"></a> [gcp\_alloydb\_postgresql\_cluster\_gateway\_id](#input\_gcp\_alloydb\_postgresql\_cluster\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_alloydb_postgresql_cluster_logs_destination_asset_id"></a> [gcp\_alloydb\_postgresql\_cluster\_logs\_destination\_asset\_id](#input\_gcp\_alloydb\_postgresql\_cluster\_logs\_destination\_asset\_id) | The asset\_id of the GCP PUSUB asset that this asset is sending its audit logs to. | `string` | `null` | no |
| <a name="input_gcp_alloydb_postgresql_cluster_parent_asset_id"></a> [gcp\_alloydb\_postgresql\_cluster\_parent\_asset\_id](#input\_gcp\_alloydb\_postgresql\_cluster\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |
| <a name="input_gcp_alloydb_postgresql_cluster_server_port"></a> [gcp\_alloydb\_postgresql\_cluster\_server\_port](#input\_gcp\_alloydb\_postgresql\_cluster\_server\_port) | Port that the AlloyDB for PostgreSQL instance listens on. | `string` | `"5432"` | no |
| <a name="input_gcp_alloydb_postgresql_gateway_id"></a> [gcp\_alloydb\_postgresql\_gateway\_id](#input\_gcp\_alloydb\_postgresql\_gateway\_id) | Unique identifier (UID) attached to the jSonar machine controlling the asset | `string` | n/a | yes |
| <a name="input_gcp_alloydb_postgresql_parent_asset_id"></a> [gcp\_alloydb\_postgresql\_parent\_asset\_id](#input\_gcp\_alloydb\_postgresql\_parent\_asset\_id) | The asset\_id of the GCP asset representing the GCP account where this data source is located. | `string` | `null` | no |
| <a name="input_gcp_alloydb_postgresql_server_port"></a> [gcp\_alloydb\_postgresql\_server\_port](#input\_gcp\_alloydb\_postgresql\_server\_port) | Port that the AlloyDB for PostgreSQL instance listens on. | `string` | `"5432"` | no |
| <a name="input_primary_instance_cidr_range"></a> [primary\_instance\_cidr\_range](#input\_primary\_instance\_cidr\_range) | CIDR range for one authorized network of the instance. | `string` | `null` | no |
| <a name="input_primary_instance_database_flags"></a> [primary\_instance\_database\_flags](#input\_primary\_instance\_database\_flags) | List of database flags to assign to the instance. See the example module for required flags for different DSF versions. | `map(string)` | `null` | no |
| <a name="input_primary_instance_enable_outbound_public_ip"></a> [primary\_instance\_enable\_outbound\_public\_ip](#input\_primary\_instance\_enable\_outbound\_public\_ip) | Whether to enable outbound public IP for the instance. Default is false. | `bool` | `false` | no |
| <a name="input_primary_instance_enable_public_ip"></a> [primary\_instance\_enable\_public\_ip](#input\_primary\_instance\_enable\_public\_ip) | Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance. Default is false. | `bool` | `false` | no |
| <a name="input_primary_instance_id"></a> [primary\_instance\_id](#input\_primary\_instance\_id) | The ID of the AlloyDB instance. | `string` | n/a | yes |
| <a name="input_primary_instance_labels"></a> [primary\_instance\_labels](#input\_primary\_instance\_labels) | Labels to apply to this instance. | `map(string)` | `{}` | no |
| <a name="input_read_pool_instance_cidr_range"></a> [read\_pool\_instance\_cidr\_range](#input\_read\_pool\_instance\_cidr\_range) | CIDR range for one authorized network of the instance. | `string` | `null` | no |
| <a name="input_read_pool_instance_database_flags"></a> [read\_pool\_instance\_database\_flags](#input\_read\_pool\_instance\_database\_flags) | List of database flags to assign to the instance. See the example module for required flags for different DSF versions. | `map(string)` | `null` | no |
| <a name="input_read_pool_instance_enable_outbound_public_ip"></a> [read\_pool\_instance\_enable\_outbound\_public\_ip](#input\_read\_pool\_instance\_enable\_outbound\_public\_ip) | Whether to enable outbound public IP for the instance. Default is false. | `bool` | `false` | no |
| <a name="input_read_pool_instance_enable_public_ip"></a> [read\_pool\_instance\_enable\_public\_ip](#input\_read\_pool\_instance\_enable\_public\_ip) | Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance. Default is false. | `bool` | `false` | no |
| <a name="input_read_pool_instance_id"></a> [read\_pool\_instance\_id](#input\_read\_pool\_instance\_id) | The ID of the AlloyDB instance. | `string` | n/a | yes |
| <a name="input_read_pool_instance_labels"></a> [read\_pool\_instance\_labels](#input\_read\_pool\_instance\_labels) | Labels to apply to this instance. | `map(string)` | `{}` | no |
| <a name="input_read_pool_instance_node_count"></a> [read\_pool\_instance\_node\_count](#input\_read\_pool\_instance\_node\_count) | Number of nodes in the read pool. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp-alloydb-cluster"></a> [gcp-alloydb-cluster](#output\_gcp-alloydb-cluster) | Google AlloyDB for PostgreSQL cluster |
| <a name="output_gcp-alloydb-postgresql-asset"></a> [gcp-alloydb-postgresql-asset](#output\_gcp-alloydb-postgresql-asset) | GCP ALLOYDB POSTGRESQL asset |
| <a name="output_gcp-alloydb-postgresql-cluster-asset"></a> [gcp-alloydb-postgresql-cluster-asset](#output\_gcp-alloydb-postgresql-cluster-asset) | GCP ALLOYDB POSTGRESQL CLUSTER asset |
| <a name="output_gcp-alloydb-primary-instance"></a> [gcp-alloydb-primary-instance](#output\_gcp-alloydb-primary-instance) | Google AlloyDB for PostgreSQL primary instance |
| <a name="output_gcp-alloydb-read-pool-instance"></a> [gcp-alloydb-read-pool-instance](#output\_gcp-alloydb-read-pool-instance) | Google AlloyDB for PostgreSQL reader instance |
<!-- END_TF_DOCS -->