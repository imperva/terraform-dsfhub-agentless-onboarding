# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) as of version 1.1.0.

## [1.3.0] - 2025-07-07

### Added
- Amazon RDS Oracle (Standard Audit) via S3 module with many-to-one-monitoring support/example in one region

### Fixed
- Removed use of deprecated inline_policy in aws-iam-role resource
- Modified aws-kinesis-firehose-delivery-stream to support multiple parameters and cloudwatch_logging_options

## [1.2.0] - 2025-06-20

### Added
- Azure Database for MySQL Flexible Server module with Slow Query example
- Azure Cosmos DB for Table API module with many-to-one example
- Google Cloud AlloyDB for PostgreSQL slow query monitoring example
- Added optional firewall rule resources for several Azure modules

### Fixed
- Fixed typo in Google Cloud AlloyDB for PostgreSQL Log Router sink inclusion filters
- Removed use of deprecated arguments in helper modules used by onboard-azure-eventhub module
- Added time_sleep between destruction of Azure Cosmos DB account resource and Diagnostic Setting resource

## [1.1.0] - 2025-05-09

### Added
- Google Cloud AlloyDB for PostgreSQL module with many-to-one example

## [1.0.10] - 2025-02-27

### Added
- Google Cloud Spanner module with slow query and many-to-one examples

## [1.0.9] - 2024-11-22

### Added
- Amazon RDS Aurora PostgreSQL via CloudWatch with slow query auditing example
- Google Cloud SQL for MySQL module
- Google Cloud SQL for PostgreSQL module
- Google Cloud SQL for SQL Server module

### Fixed
- Modified Server Host Name of AWS RDS MS SQL SERVER Dsfhub assets

## [1.0.8] - 2024-10-15

### Added
- GCP account asset module
- Google Cloud BigQuery module

## [1.0.7] - 2024-10-03

### Added
- Azure Database for PostgreSQL Flexible Server module
- Azure SQL Managed Instance module

## [1.0.6] - 2024-09-17

### Added
- Azure Cosmos DB for MongoDB module
- Azure Cosmos DB for NoSQL module
- Azure SQL Server module

## [1.0.5] - 2024-08-29

### Added
- Amazon RDS SQL Server module
- Refactored Amazon RDS Aurora (MySQL and PostgreSQL) module variables

## [1.0.4] - 2024-07-25

### Added
- Amazon DynamoDB via CloudWatch module
- Amazon DynamoDB via S3 Bucket module

## [1.0.3] - 2024-07-22

### Added
- Amazon RDS Aurora MySQL module
- Amazon RDS Aurora MySQL Kinesis module
- Amazon RDS Aurora MySQL Slow Query module
- Amazon RDS Aurora PostgreSQL via CloudWatch module
- Amazon RDS Aurora PostgreSQL via Kinesis module

## [1.0.2] - 2024-07-12

### Added
- Amazon DocumentDB module
- Amazon Neptune module
- Amazon Neptune Slow query module
- Amazon RDS MariaDB module
- Amazon RDS MySQL module
- Amazon RDS MySQL Slow query module
- Amazon RDS Oracle (standard auditing) module
- Amazon RDS Oracle (unified auditing) module
- Amazon Redshift (via ODBC) module
- Amazon Redshift (via S3 bucket) module

## [1.0.1] - 2024-06-27

### Fixed
- Updated example module sources to point to registry

## [1.0.0] - 2024-06-25

### Added
- Amazon RDS PostgreSQL module
