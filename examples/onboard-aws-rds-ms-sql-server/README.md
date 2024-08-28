# Onboard Amazon RDS for SQL Server example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Amazon-RDS-for-SQL-Server-Onboarding-Steps_48367099.html).

It creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each one can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Database Configuration
Part of the onboarding process involves connecting to your RDS MS SQL Server instance and running SQL commands to create an audit policy. This module includes an example for how to connect to the instance from your local machine and create it. 

**Note:** This example requires the ``sqlcmd`` client to be installed, as well as for the newly created RDS MS SQL Server instance to be accessible from your local machine. 

### Account Asset Permissions
An AWS account asset will need to be onboarded to your DSF hub prior to using this module. The account asset will need to be granted permissions to be able to read from the newly created S3 bucket. In addition, the cloud account should be granted these additional permissions:

```
rds:DescribeOptionGroups
s3:GetObject
s3:ListBucket
s3:ListAllMyBuckets
```
