resource "aws_docdb_cluster_instance" "this" {

  apply_immediately = var.apply_immediately

  cluster_identifier = var.cluster_identifier
  count              = var.instance_count
  engine             = "docdb"
  instance_class     = var.instance_class
  identifier         = "${var.cluster_identifier}-${count.index}"
  promotion_tier     = var.promotion_tier
  tags               = var.tags
}
