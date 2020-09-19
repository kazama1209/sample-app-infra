# セキュリティグループ（security_group）

# アプリ全体
resource "aws_security_group" "sample-app-sg" {
  name        = "${var.prefix}-sg"
  description = "${var.prefix}-sg"
  vpc_id      = "${aws_vpc.sample-app-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-sg"
  }
}

# ロードバランサー
resource "aws_security_group" "sample-app-alb-sg" {
  name        = "${var.prefix}-alb-sg"
  description = "${var.prefix}-alb-sg"
  vpc_id      = "${aws_vpc.sample-app-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-alb-sg"
  }
}

# データベース
resource "aws_security_group" "sample-app-db-sg" {
  name        = "${var.prefix}-db-sg"
  description = "${var.prefix}-db-sg"
  vpc_id      = "${aws_vpc.sample-app-vpc.id}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-db-sg"
  }
}
