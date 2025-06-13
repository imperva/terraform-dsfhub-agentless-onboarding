# DSF Version Compatibility

The following table lists the DSF versions against which each module is tested and maintained.
<table>
  <tr>
   <th>Data Source</th>
   <th>Module</th>
   <th>DSF Versions</th>
   <th>Notes</th>
  </tr>

   <tr>
      <td>Amazon DocumentDB</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-docdb-cluster">onboard-aws-docdb-cluster</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon DynamoDB via CloudWatch</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-dynamodb-cloudwatch">onboard-aws-dynamodb-cloudwatch</a></td>
      <td>4.16+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon DynamoDB via S3</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-dynamodb-s3">onboard-aws-dynamodb-s3</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon Neptune</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-neptune">onboard-aws-neptune</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon Neptune with Slow Query</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-neptune-slow-query">onboard-aws-neptune-slow-query</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon RDS Aurora MySQL via CloudWatch</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-aurora-mysql">onboard-aws-rds-aurora-mysql</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon RDS Aurora MySQL via Kinesis</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-aurora-mysql-kinesis">onboard-aws-rds-aurora-mysql-kinesis</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon RDS Aurora MySQL via CloudWatch with Slow Query</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-aurora-mysql-slowquery">onboard-aws-rds-aurora-mysql-slowquery</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon RDS Aurora PostgreSQL via CloudWatch</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-aurora-postgresql">onboard-aws-rds-aurora-postgresql</a></td>
      <td>4.17+</td>
      <td>Supports slow query monitoring and aggregated queries</td>
   </tr>
   <tr>
      <td>Amazon RDS Aurora PostgreSQL via Kinesis</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-aurora-postgresql-kinesis">onboard-aws-rds-aurora-postgresql-kinesis</a></td>
      <td>4.17+</td>
      <td>Supports aggregated queries</td>
   </tr>
   <tr>
      <td>Amazon RDS for MariaDB</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-mariadb">onboard-aws-rds-mariadb</a></td>
      <td>4.16+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon RDS for SQL Server</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-ms-sql-server">onboard-aws-rds-ms-sql-server</a></td>
      <td>4.17+</td>
      <td>Supports many-to-one monitoring</td>
   </tr>
      <tr>
      <td>Amazon RDS for MySQL</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-mysql">onboard-aws-rds-mysql</a></td>
      <td>4.16+</td>
      <td>Supports aggregated queries</td>
   </tr>
   <tr>
      <td>Amazon RDS for MySQL with Slow Query</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-mysql-slow-query">onboard-aws-rds-mysql-slow-query</a></td>
      <td>4.16+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon RDS for Oracle (Standard Audit via CloudWatch)</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-oracle-standard">onboard-aws-rds-oracle-standard</a></td>
      <td>4.16+</td>
      <td>Supports aggregated queries</td>
   </tr>
   <tr>
      <td>Amazon RDS for Oracle (Unified Audit)</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-oracle-unified">onboard-aws-rds-oracle-unified</a></td>
      <td>4.16+</td>
      <td>Supports aggregated queries</td>
   </tr>
   <tr>
      <td>Amazon RDS for PostgreSQL</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-rds-postgresql">onboard-aws-rds-postgresql</a></td>
      <td>4.16+</td>
      <td>Supports slow query monitoring and aggregated queries</td>
   </tr>
   <tr>
      <td>Amazon Redshift via ODBC</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-redshift-odbc">onboard-aws-redshift-odbc</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Amazon Redshift via S3</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-aws-redshift-s3">onboard-aws-redshift-s3</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>Azure Cosmos DB for MongoDB</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-azure-cosmosdb-mongo">onboard-azure-cosmosdb-mongo</a></td>
      <td>4.17+</td>
      <td>Supports many-to-one monitoring</td>
   </tr>
   <tr>
      <td>Azure Cosmos DB for NoSQL</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-azure-cosmosdb-nosql">onboard-azure-cosmosdb-nosql</a></td>
      <td>4.17+</td>
      <td>Supports many-to-one monitoring</td>
   </tr>
   <tr>
      <td>Azure MS SQL Server</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-azure-ms-sql-server">onboard-azure-ms-sql-server</a></td>
      <td>4.17+</td>
      <td>Supports many-to-one monitoring</td>
   </tr>
   <tr>
      <td>Azure Database for MySQL Flexible Server</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-azure-mysql-flexible">onboard-azure-mysql-flexible</a></td>
      <td>15.0+</td>
      <td>Supports slow query monitoring</td>
   </tr>
   <tr>
      <td>Azure Database for PostgreSQL Flexible Server</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-azure-postgresql-flexible">onboard-azure-postgresql-flexible</a></td>
      <td>4.17+</td>
      <td>Supports slow query and many-to-one monitoring</td>
   </tr>
   <tr>
      <td>Azure SQL Managed Instance</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-azure-sql-managed-instance">onboard-azure-sql-managed-instance</a></td>
      <td>4.17+</td>
      <td></td>
   </tr>
   <tr>
      <td>GCP Bigquery (example module)</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/examples/onboard-gcp-bigquery">onboard-gcp-bigquery</a></td>
      <td>4.17+</td>
      <td>Does not support resource management, only onboarding of the asset</td>
   </tr>
   <tr>
      <td>GCP Cloud SQL for SQL Server</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-gcp-ms-sql-server">onboard-gcp-ms-sql-server</a></td>
      <td>4.17+</td>
      <td>Supports many-to-one monitoring</td>
   </tr>
   <tr>
      <td>GCP Cloud SQL for MySQL</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-gcp-mysql">onboard-gcp-mysql</a></td>
      <td>4.17+</td>
      <td>Supports slow query and many-to-one monitoring</td>
   </tr>
   <tr>
       <td>GCP Cloud SQL for PostgreSQL</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-gcp-postgresql">onboard-gcp-postgresql</a></td>
      <td>4.17+</td>
      <td>Supports slow query and many-to-one monitoring</td>
   </tr>
   <tr>
      <td>GCP Spanner</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-gcp-spanner">onboard-gcp-spanner</a></td>
      <td>4.19+</td>
      <td>Supports slow query monitoring, includes examples for one-to-one and many-to-one monitoring</td>
   </tr>
      <tr>
      <td>GCP AlloyDB for PostgreSQL</td>
      <td><a href="https://github.com/imperva/terraform-dsfhub-agentless-onboarding/tree/main/modules/onboard-gcp-alloydb-postgresql">onboard-gcp-alloydb-postgresql</a></td>
      <td>4.19+</td>
      <td>Includes examples for one-to-one, many-to-one and slow query monitoring</td>
   </tr>

</table>