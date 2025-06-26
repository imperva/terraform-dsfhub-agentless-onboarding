# Onboard Amazon RDS for Oracle (Standard Audit via S3) example

This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/684326932.html).

This example creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Account Asset Permissions
An AWS account asset will need to be onboarded to your DSF hub prior to using this module. The account asset will need to be granted permissions to be able to read from the newly created S3 bucket. 

### Database Configuration
Part of the onboarding process involves connecting to your RDS Oracle instance and running SQL commands to create an audit policy. This module includes an example for how to connect to the instance from your local machine and create this. 

**Note:** This example requires the ``sqlplus`` client to be installed, as well as for the newly created RDS instance to be accessible from your local machine. 
