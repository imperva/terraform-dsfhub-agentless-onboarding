# AWS S3 Bucket variables
variable "s3_bucket" {
  description = "The name of the bucket. Must be lowercase and less than or equal to 63 characters in length."
  type        = string
}

variable "s3_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the (aws terraform documentation)[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy]."
  type        = bool
  default     = false
}

variable "s3_object_lock_enabled" {
  description = "A boolean that indicates whether this bucket should have an Object Lock configuration enabled."
  type        = bool
  default     = false
}

variable "s3_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

# AWS IAM Variables
variable "iam_role_name" {
  description = "Friendly name of the IAM role that grants SQL Server access to write to an S3 bucket. Forces new resource."
  type        = string
  default     = "tf_rds_mssql_s3_audit_role"
}

variable "iam_role_path" {
  description = "The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide."
  type        = string
  default     = "/service-role/"
}

variable "iam_policy_name" {
  description = "Friendly name of the IAM policy that grants SQL Server access to write to an S3 bucket. Forces new resource."
  type        = string
  default     = "tf_rds_mssql_s3_audit_policy"
}

# Option Group variables
variable "option_group_description" {
  description = "The description of the RDS option group."
  type        = string
  default     = null
}

variable "option_group_engine_name" {
  description = "Specifies the name of the engine that this option group should be associated with. Valid options: 'sqlserver-ee', 'sqlserver-ex', 'sqlserver-se', 'sqlserver-web'."
  type        = string
  validation {
    condition     = contains(["sqlserver-ee", "sqlserver-ex", "sqlserver-se", "sqlserver-web"], var.option_group_engine_name)
    error_message = "Invalid engine name. Valid options: 'sqlserver-ee', 'sqlserver-ex', 'sqlserver-se', 'sqlserver-web'."
  }
}

variable "option_group_major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with. Supported options: '14.00', '15.00'."
  type        = string
  validation {
    condition     = contains(["14.00", "15.00"], var.option_group_major_engine_version)
    error_message = "Invalid major engine version. Supported options: '14.00', '15.00'."
  }
}

variable "option_group_name" {
  description = "The name of the RDS option group."
  type        = string
}

variable "option_group_additional_audit_option_settings" {
  description = "A list of additional option settings to apply to the SQLSERVER_AUDIT option group."
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "option_group_additional_options" {
  description = "A list of additional options to apply to this Option Group."
  type = list(object({
    option_name = string
    option_settings = list(object({
      name  = string
      value = string
    }))
  }))
  default = []
}

variable "option_group_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "s3_bucket_prefix" {
  description = "The prefix to use for the S3 bucket. Required when auditing multiple RDS SQL Server instances sharing the same 'DB Identifier' across various regions or AWS accounts. Format: '/region/account_id', e.g. '/us-east-1/123456789012'."
  type        = string
  default     = ""
  validation {
    condition     = var.s3_bucket_prefix != "" ? can(regex("^/[a-z]{2}(-gov)?-[a-z]+-[0-9]{1}/[0-9]{12}$", var.s3_bucket_prefix)) : true
    error_message = "The S3 bucket prefix must be in the format '/region/account_id', e.g. '/us-east-1/123456789012'."
  }
}

# AWS RDS SQL Server instance variables
variable "db_instance_count" {
  description = "The number of RDS instances to create."
  type        = number
  default     = 1
}

variable "rds_mssql_allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance. Default: 20."
  type        = number
  default     = 20
}

variable "rds_mssql_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "rds_mssql_db_name" {
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance."
  type        = string
  default     = null
}

variable "rds_mssql_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "rds_mssql_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}

variable "rds_mssql_identifier" {
  description = "The name of the RDS instance."
  type        = string
}

variable "rds_mssql_instance_class" {
  description = "The instance type of the RDS instance. For supported range of DB instance classes for RDS SQL Server, see the [AWS Docs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.InstanceClasses) or use the /`aws rds describe-orderable-db-instance-options/` CLI command. Default: db.t3.xlarge"
  type        = string
  default     = "db.t3.xlarge"
}

variable "rds_mssql_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage."
  type        = number
  default     = null
}

variable "rds_mssql_option_group_name" {
  description = "Name of the option group to associate with the RDS instance."
  type        = string
  default     = null
}

variable "rds_mssql_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "rds_mssql_port" {
  description = "The port on which the DB accepts connections. Default: 1433"
  type        = number
  default     = 1433
}

variable "rds_mssql_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = true
}

variable "rds_mssql_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier."
  type        = bool
  default     = true
}

variable "rds_mssql_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
  default     = null
}
variable "rds_mssql_tags" {
  description = "A map of tags to assign to the RDS instance."
  type        = map(string)
  default     = null
}

variable "rds_mssql_username" {
  description = "Username for the master DB user. Default: 'admin'."
  type        = string
  default     = "admin"
}

variable "rds_mssql_vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
  default     = null
}

# AWS RDS MS SQL Server asset variables
variable "aws_rds_mssql_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_rds_mssql_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "aws_rds_mssql_db_engine_version" {
  description = "Denotes the major version of the asset, e.g. 2017 or 2019."
  type        = string
  default     = null
}

variable "aws_rds_mssql_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_rds_mssql_parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events)"
  type        = string
  default     = null
}

variable "aws_rds_mssql_region" {
  description = "AWS region containing the instance."
  type        = string
  default     = null
}

# AWS S3 Asset variables
variable "aws_s3_admin_email" {
  description = "The email address to notify about the S3 asset"
  type        = string
}

variable "aws_s3_audit_pull_enabled" {
  description = "A boolean that indicates if the asset should be audited."
  type        = bool
  default     = true
}

variable "aws_s3_bucket_account_id" {
  description = "The account_id of the bucket owner"
  type        = string
  default     = null
}

variable "aws_s3_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the S3 asset"
  type        = string
}

variable "aws_s3_parent_asset_id" {
  description = "The asset_id of AWS cloud account being used. E.g. Key-pair, iam_role, profile or default"
  type        = string
}

variable "aws_s3_server_port" {
  description = "Port used by the source server. Default: 443"
  type        = number
  default     = 443
}

variable "aws_s3_region" {
  description = "AWS region containing the S3 bucket."
  type        = string
}
