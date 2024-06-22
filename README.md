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
   <td><strong>Link</strong>
   </td>
   <td><strong>Details</strong>
   </td>
  </tr>

   <tr>
      <td><a href="https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Onboarding-Databases-to-Imperva-Sonar---Overview_21077247.html">Onboarding Databases to Imperva Sonar - Overview</a>
      </td>
      <td>Onboarding documentation
      </td>
   </tr>

  <tr>
   <td>
   <a href="https://registry.terraform.io/providers/imperva/dsfhub/latest/docs">DSF Hub</a>

   <a href="https://registry.terraform.io/providers/hashicorp/aws/latest">AWS</a>

   <a href="https://registry.terraform.io/providers/hashicorp/azurerm/latest">Azure</a>

   <a href="https://registry.terraform.io/providers/hashicorp/google/latest">GCP</a>
   </td>
   <td>Relevant provider registries
   </td>
  </tr>

  <tr>
   <td>
    <a href="https://www.terraform.io/downloads">Download Terraform</a>
   </td>
   <td>Terraform installation instructions</td>
  </tr>

</table>

## Getting Started
placeholder

## Version History
placeholder

## Troubleshooting
If you encounter a problem with these modules, please open a [Github issue](https://github.com/imperva/terraform-dsfhub-agentless-onboarding/issues/new) and attach the relevant terraform logs. You can gather additional debug information by setting environment variables before running your terraform commands:
```
$ export TF_LOG=DEBUG 
$ export TF_LOG_PATH=terraform_debug.log 
$ terraform apply -auto-approve
```
