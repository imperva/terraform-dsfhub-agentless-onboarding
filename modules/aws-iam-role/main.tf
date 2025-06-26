resource "aws_iam_role" "this" {
  assume_role_policy    = var.assume_role_policy
  name                  = var.name
  name_prefix           = var.name_prefix
  description           = var.description
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  path                  = var.path
  permissions_boundary  = var.permissions_boundary
  tags                  = var.tags
}
