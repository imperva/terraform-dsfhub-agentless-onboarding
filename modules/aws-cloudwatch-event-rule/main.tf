resource "aws_cloudwatch_event_rule" "this" {
  description   = var.description
  name          = var.name
  event_pattern = var.event_pattern
  state         = var.state
  tags          = var.tags
}
