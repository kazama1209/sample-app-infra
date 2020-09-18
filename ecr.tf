# ECR（リポジトリ）

# Rails
resource "aws_ecr_repository" "sample-app-rails" {
  name                 = "${var.prefix}-rails"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Nginx
resource "aws_ecr_repository" "sample-app-nginx" {
  name                 = "${var.prefix}-nginx"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
