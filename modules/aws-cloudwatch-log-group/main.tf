resource "aws_cloudwatch_log_group" "this" {
  log_group_class   = var.log_group_class
  name              = var.name
  retention_in_days = var.retention_in_days
  skip_destroy      = var.skip_destroy
  tags              = var.tags
}
