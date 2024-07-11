resource "aws_iam_policy" "this" {
  name        = var.name
  name_prefix = var.name_prefix
  description = var.description
  path        = var.path
  policy      = var.policy
  tags        = var.tags
}
