resource "aws_cloudwatch_event_target" "this" {
  arn      = var.arn
  role_arn = var.role_arn
  rule     = var.rule
}
