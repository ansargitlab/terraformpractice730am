resource "aws_db_instance" "this" {
  identifier              = var.db_identifier
  allocated_storage       = var.db_allocated_storage
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = var.db_subnet_group_name
  skip_final_snapshot     = true
  publicly_accessible     = var.publicly_accessible
  deletion_protection     = var.deletion_protection

  tags = {
    Name = var.db_identifier
  }
}
