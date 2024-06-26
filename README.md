# DSF Hub Agentless Data Source Onboarding Modules

## About This Guide

### Purpose and Scope
The purpose of this repository is to give examples for how to create data sources from scratch and have them onboarded to DSF Hub automatically. Many examples will require that additional configurations be made on a data source directly (e.g. running a SQL command to create an extension on an RDS instance) and if so, will provide a possible example showing how to make these configuration changes.

These examples are meant to set up basic versions of a data source with all the necessary configurations for the source to be monitored by DSF Hub, but may not cover all possible configurations of a data source. For example, many of the modules rely on a basic [aws_db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) helper module that may need to be substituted to meet your needs. Please see the [Directory Structure](#directory-structure) section for more information.


### Directory Structure
This repository contains many helper modules that are used as part of the onboarding process - both cloud resource modules as well as DSF Hub asset modules are included. The ``examples`` directory contains examples for the onboarding of data sources, but will not cover the majority of these helper modules. 

The general naming convention is:

```bash
examples/
└── onboard-<data-source-server-type>
    ├── README.md
    ├── additional_configuration_file1
    ├── additional_configuration_file2
    └── main.tf
modules/
├── <cloud-provider>-<resource-name>
├── dsfhub-<data-source-server-type>
└── onboard-<data-source-server-type>
    ├── README.md
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
```

For example, for onboarding AWS RDS PostgreSQL,
```bash
examples/
└── onboard-aws-rds-postgresql
    ├── README.md
    ├── configure_database.sh
    ├── configure_database.sql
    └── main.tf
modules/
├── aws-cloudwatch-log-group
├── aws-rds-instance
├── aws-rds-parameter-group
├── dsfhub-aws-log-group
├── dsfhub-aws-rds-postgresql
└── onboard-aws-rds-postgresql
    ├── README.md
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
```

### Quick Links

This guide references the following information and links, some of which are available via the Documention Portal on the Imperva website: [https://docs.imperva.com](https://docs.imperva.com).  (Login required)

<table>
  <tr>
   <th>Link</th>
   <th>Details</th>
  </tr>

   <tr>
      <td><a href="https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Onboarding-Databases-to-Imperva-Sonar---Overview_21077247.html">Onboarding Databases to Imperva Sonar - Overview</a>
      </td>
      <td>Onboarding documentation
      </td>
   </tr>

  <tr>
   <td>
   <a href="https://registry.terraform.io/providers/imperva/dsfhub/latest">DSF Hub</a>,
   <a href="https://registry.terraform.io/providers/hashicorp/aws/latest">AWS</a>,
   <a href="https://registry.terraform.io/providers/hashicorp/azurerm/latest">Azure</a>,
   <a href="https://registry.terraform.io/providers/hashicorp/google/latest">GCP</a>
   </td>
   <td>Relevant provider registries</td>
  </tr>

  <tr>
   <td>
    <a href="https://www.terraform.io/downloads">Download Terraform</a>
   </td>
   <td>Terraform installation instructions</td>
  </tr>

  <tr>
    <td><a href="https://docs.imperva.com/bundle/v4.16-sonar-user-guide/page/84555.htm">Generating a DSF Hub Authorization Token</a></td>
    <td></td>
  </tr>

</table>

### DSF Version Compatibility
To see the full list of DSF versions that each module is supported for, see [DSF Version Compatability](DSF_VERSION_COMPATABILITY.md).

### Version History
All notable changes to the project will be documented within the [change log](CHANGELOG.md).


## Usage
Onboarding a database to DSF hub using one of these modules will require the following items before beginning:
- A working DSF hub installation with access to the "secAdmin" user
- Cloud provider credentials (e.g., AWS, azurerm, etc.) with permissions to create the resources defined in the module
- A working installation of Terraform

The specific module may also require additional configurations. More details can be found in the specific module, and its corresponding example.

The following example will go through the steps for onboarding Amazon RDS for PostgreSQL, but the ideas apply to all modules.

### Generate a DSF Authorization Token
Using the ``dsfhub`` provider will require an authorization token that has been given access to the Unified Settings Console. To generate one, follow the instructions described in [Generating an Authorization Token for DSF Open APIs](https://docs.imperva.com/bundle/v4.16-sonar-user-guide/page/84555.htm).

### Configure the Providers
Both the ``aws`` and ``dsfhub`` providers offer different methods for configuration. In this example, we will define authentication keys using environment variables.

To configure the [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest) provider, export the hostname of your DSF hub as well as the authorization token created above
```bash
$ export TF_VAR_dsfhub_host='https://1.2.3.4:8443'
$ export TF_VAR_dsfhub_token='a1b2c3d4-e5f6-g8h9-wxyz-123456790'
```

The [aws](https://registry.terraform.io/providers/hashicorp/aws/latest) provider can also be configured using environment variables. To do so, export your key pair that has permissions to create resources
```bash
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
``` 

### Complete Module Prerequisites
The Amazon RDS for PostgreSQL module has two prerequisites:
1. An AWS cloud account asset with permissions to read from CloudWatch log groups
2. A method to create the 'pgaudit' extension and 'rds_pgaudit' role on the postgres instance

AWS cloud account assets support a few different authentication mechanisms but in this example, we'll assume that we will leverage the default IAM role attached to the agentless gateway. The asset itself will be created in the next step, but will require the ``arn`` of the attached role to be used as the ``asset_id``.

The ``pgaudit`` extension and ``rds_pgaudit`` role need to be created by running SQL commands against the RDS PostgreSQL instance. In this example, we'll use the ``psql`` client to connect from our local machine and run the commands. Note that this will require the instance be accessible from the local machine running terraform.

The ``psql`` client can be installed simply with a package manager. On MacOS, you can run the following

```bash
$ brew install libpq
```
or, on RedHat

```bash
$ yum install postgresql
```
Run the following to confirm the installation

```bash
$ psql --version
```

Finally, copy the ``configure_database`` files from ``examples/onboard-aws-rds-postgresql`` to the directory containing your terraform configurations.


### Create Resources
Create a ``main.tf`` file with the following contents, updating variable names as needed for your deployment

```hcl
locals {
  aws_region = "us-east-2"

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
}

################################################################################
# Providers
################################################################################
terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# Prerequisites
# 1. AWS cloud account
# 2. Method to create 'pgaudit' extension and 'rds_pgaudit' role on the postgres
#    instance.
################################################################################
# 1. AWS cloud account
module "aws-default-account-asset" {
  source = "../../modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-account-asset"
  asset_id           = "arn:aws:iam::1234567890"
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

# 2. Run shell script locally to create extension and role on the newly created
#    postgres instance. 
resource "terraform_data" "configure_database" {
  depends_on = [module.aws-rds-postgresql]

  provisioner "local-exec" {
    environment = {
      PGHOST     = module.aws-rds-postgresql.postgres-instance.address
      PGUSER     = "admin"
      PGPASSWORD = "abcd1234"
      PGPORT     = module.aws-rds-postgresql.postgres-instance.port
      PGDATABASE = module.aws-rds-postgresql.postgres-instance.db_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# Amazon RDS for PostgreSQL 16.0
################################################################################
module "aws-rds-postgresql" {
  source = "../../modules/onboard-aws-rds-postgresql"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.admin_email
  aws_log_group_region             = local.aws_region

  aws_rds_postgresql_admin_email     = local.admin_email
  aws_rds_postgresql_gateway_id      = local.gateway_id
  aws_rds_postgresql_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_rds_postgresql_region          = local.aws_region

  instance_db_name             = "testdb"
  instance_engine              = "postgres"
  instance_engine_version      = "16"
  instance_identifier          = "example-tf-postgres-16"
  instance_instance_class      = "db.t3.small"
  instance_password            = "abcd1234"
  instance_publicly_accessible = true
  instance_skip_final_snapshot = true
  instance_subnet_group_name   = "default"
  instance_username            = "admin"
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  parameter_group_family = "postgres16"
  parameter_group_name   = "example-tf-postgres-16-pg"
}
```

and then run the following terraform commands to create the resources
```
$ terraform init
$ terraform plan
$ terraform apply
```

## Troubleshooting
If you encounter a problem with these modules, please open a [Github issue](https://github.com/imperva/terraform-dsfhub-agentless-onboarding/issues/new) and attach the relevant terraform logs. You can gather additional debug information by setting environment variables before running your terraform commands:
```
$ export TF_LOG=DEBUG 
$ export TF_LOG_PATH=terraform_debug.log 
$ terraform apply -auto-approve
```
