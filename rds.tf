# RDS（データベース）

resource "aws_db_subnet_group" "sample-app-db-subnet" {
  name       = "${var.prefix}-db-subnet"
  subnet_ids = ["${aws_subnet.sample-app-public-subnet-1a.id}", "${aws_subnet.sample-app-public-subnet-1c.id}"]

  tags = {
    Name = "${var.prefix}-db-subnet"
  }
}

variable "database_name" {}
variable "database_username" {}
variable "database_password" {}

resource "aws_db_instance" "sample-app-db" {
  identifier          = "${var.prefix}-db"
  engine              = "mysql"
  engine_version      = "5.7.30"
  instance_class      = "db.t2.micro"
  allocated_storage   = 20
  storage_type        = "gp2"
  name                = "${var.database_name}"
  username            = "${var.database_username}"
  password            = "${var.database_password}"
  port                = 3306
  multi_az            = true
  publicly_accessible = true
  skip_final_snapshot = true

  vpc_security_group_ids = ["${aws_security_group.sample-app-db-sg.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.sample-app-db-subnet.name}"
}
