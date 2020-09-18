# セキュリティグループ（security_group）

# アプリ全体
resource "aws_security_group" "sample-app-sg" {
  name        = "${var.prefix}-sg"
  description = "${var.prefix}-sg"
  vpc_id      = "${aws_vpc.sample-app-vpc.id}"
  
  tags = {
    Name = "${var.prefix}-sg"
  }
}

resource "aws_security_group_rule" "sample-app-sg-ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
  ]

  security_group_id = "${aws_security_group.sample-app-sg.id}"
}

resource "aws_security_group_rule" "sample-app-sg-egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = "${aws_security_group.sample-app-sg.id}"
}

# ロードバランサー
resource "aws_security_group" "sample-app-alb-sg" {
  name        = "${var.prefix}-alb-sg"
  description = "${var.prefix}-alb-sg"
  vpc_id      = "${aws_vpc.sample-app-vpc.id}"
  
  tags = {
    Name = "${var.prefix}-alb-sg"
  }
}

resource "aws_security_group_rule" "sample-app-alb-sg-ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
  ]

  security_group_id = "${aws_security_group.sample-app-alb-sg.id}"
}

resource "aws_security_group_rule" "sample-app-alb-sg-egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = "${aws_security_group.sample-app-alb-sg.id}"
}

# データベース
resource "aws_security_group" "sample-app-db-sg" {
  name        = "${var.prefix}-db-sg"
  description = "${var.prefix}-db-sg"
  vpc_id      = "${aws_vpc.sample-app-vpc.id}"
  
  tags = {
    Name = "${var.prefix}-db-sg"
  }
}

resource "aws_security_group_rule" "sample-app-db-sg-ingress" {
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0",
  ]

  security_group_id = "${aws_security_group.sample-app-db-sg.id}"
}

resource "aws_security_group_rule" "sample-app-db-sg-egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = "${aws_security_group.sample-app-db-sg.id}"
}
