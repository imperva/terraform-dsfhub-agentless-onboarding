locals {
  admin_email = "test@person.com"
  gateway_id  = "01234567-89ab-cdef-0123-456789abcdef"
}

terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

variable "dsfhub_host" {}
variable "dsfhub_token" {}

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

module "hashicorp-secret" {
  source = "../../modules/dsfhub-hashicorp-secret-manager"

  admin_email        = local.admin_email
  asset_display_name = "test-hashicorp-asset"
  asset_id           = "test-hashicorp-asset"
  gateway_id         = local.gateway_id
  server_ip          = "hashicorp-ip"
  server_port        = 8200
  server_host_name   = "hashicorp-hostname"

  auth_mechanism = "ec2"
  role_name      = "test-role-name"
  nonce          = "test-nonce"

  # optional
  headers               = ["Test-Header1: test1", "Test-Header2: test2"]
  namespace             = "test-ns"
  protocol              = "https://"
  self_signed           = true
  ssl                   = true
  store_aws_credentials = true
  v2_key_engine         = true
}

module "oracle" {
  source = "../../modules/dsfhub-oracle"

  admin_email        = local.admin_email
  application        = "my-app"
  asset_display_name = "oracle-with-sm"
  asset_id           = "oracle-with-sm"
  asset_version      = 19
  gateway_id         = local.gateway_id
  server_ip          = "oracle-ip"
  server_port        = 1521
  server_host_name   = "oracle-hostname"
  service_name       = "ORCL"

  auth_mechanism = "oracle_wallet"
  dsn            = "mydsn_high"
  password       = "dummy-pass" # will be overridden by secret manager
  sid            = "ORCL"
  username       = "dummy-user"      # will be overridden by secret manager
  wallet_dir     = "/path/to/wallet" # will be overridden by secret manager

  secret_asset_id = module.hashicorp-secret.this.asset_id
  secret_name     = "oracle-db-credentials"
  secret_type     = "hashicorp"
  path            = "secret/data/oracle/dbcreds"
  secret_field_mapping = {
    username   = "db_user"
    password   = "db_password"
    wallet_dir = "wallet_location"
  }
}
