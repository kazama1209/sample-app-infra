# ECR（リポジトリ）

# Rails
resource "aws_ecr_repository" "sample-app-rails" {
  name                 = "${var.prefix}-rails"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "sample-app-rails" {
  repository = "${aws_ecr_repository.sample-app-rails.name}"

  policy = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "Keep last 30 images",
        "selection": {
          "countType": "imageCountMoreThan",
          "countNumber": 30
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
EOF
}

# Nginx
resource "aws_ecr_repository" "sample-app-nginx" {
  name = "${var.prefix}-nginx"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
