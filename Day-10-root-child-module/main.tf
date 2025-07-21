
module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr_block       = var.vpc_cidr_block
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}
resource "aws_security_group" "rds_sg" {
  name        = var.sg_name
  description = "Allow MySQL traffic"
  vpc_id      = module.vpc.vpc_id  # assuming you already have a VPC module

  ingress {
    from_port   = var.mysql_port
    to_port     = var.mysql_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Caution: open to world! Restrict this in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_cidr_blocks
  }

  tags = {
    Name = "rds-sg"
  }
}
resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = module.vpc.private_subnet_ids  # assuming your vpc module exports private subnets

  tags = {
    Name = "rds-subnet-group"
  }
}

module "rds" {
  source                  = "./modules/rds"
  db_identifier           = var.db_identifier
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  db_instance_class       = var.db_instance_class
  db_engine               = var.db_engine
  db_engine_version       = var.db_engine_version
  db_allocated_storage    = var.db_allocated_storage
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]  # Example SG
  db_subnet_group_name    = aws_db_subnet_group.default.name
  publicly_accessible     = var.publicly_accessible
  deletion_protection     = var.deletion_protection
}
module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type

}