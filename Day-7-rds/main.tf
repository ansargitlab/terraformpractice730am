resource "aws_db_instance" "default" {
  identifier              = "mydbinstance"
  allocated_storage       = 10
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "mydatabase"
  username               = "admin"
  password               = "admin123"
  db_subnet_group_name   = aws_db_subnet_group.sub-grp.id
  backup_window = "03:00-04:00"
  maintenance_window = "Mon:04:00-Mon:05:00"
  backup_retention_period = 7

  tags = {
    Name = "mydbinstance"

   skip_final_snapshot    = true  
  } 
   depends_on = [ aws_db_subnet_group.sub-grp ]
}
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {    
        Name = "dev"
    }
  
}
resource "aws_subnet" "subnet1" {
    vpc_id                  = aws_vpc.name.id
    cidr_block              = "10.0.0.0/24" 
    availability_zone       = "us-east-1a"  
  
}
resource "aws_subnet" "subnet2" {   
    vpc_id                  = aws_vpc.name.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1b"
  
}   
resource "aws_db_subnet_group" "sub-grp" {
  name       = "mydbsubnetgroup"
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = "mydbsubnetgroup"
  }
}
