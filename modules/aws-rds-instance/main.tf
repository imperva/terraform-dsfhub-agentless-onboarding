resource "aws_db_instance" "this" {

  allocated_storage = var.allocated_storage
  apply_immediately = var.apply_immediately

  db_name                         = var.db_name
  db_subnet_group_name            = var.subnet_group_name
  deletion_protection             = var.deletion_protection
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  engine                          = var.engine
  engine_version                  = var.engine_version
  final_snapshot_identifier       = var.final_snapshot_identifier
  identifier                      = var.identifier
  instance_class                  = var.instance_class
  license_model                   = var.license_model
  max_allocated_storage           = var.max_allocated_storage
  option_group_name               = var.option_group_name
  parameter_group_name            = var.parameter_group_name
  password                        = var.password
  port                            = var.port
  publicly_accessible             = var.publicly_accessible
  skip_final_snapshot             = var.skip_final_snapshot
  tags                            = var.tags
  username                        = var.username
  vpc_security_group_ids          = var.vpc_security_group_ids
}
