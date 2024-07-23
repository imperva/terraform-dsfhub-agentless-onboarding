resource "aws_kms_key" "this" {
  customer_master_key_spec = var.custom_master_key_spec
  deletion_window_in_days  = var.deletion_window_in_days
  description              = var.description
  is_enabled               = var.is_enabled
  key_usage                = var.key_usage
  multi_region             = var.multi_region
  tags                     = var.tags
}
