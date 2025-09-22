resource "aws_ecr_repository" "automation_example" {
  name = var.repository_name

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Project = "automation-example"
  }
}
resource "aws_ecr_lifecycle_policy" "automation_example" {
  repository = aws_ecr_repository.automation_example.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Expire dev images older than 90 days, keep max 100",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["dev-"],
        "countType": "imageCountMoreThan",
        "countNumber": 100,
        "tagStatus": "tagged"
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Expire qa images older than 90 days, keep max 100",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["qa-"],
        "countType": "imageCountMoreThan",
        "countNumber": 100
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 3,
      "description": "Keep all prod images forever",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["prod-"]
      },
      "action": {
        "type": "retain"
      }
    }
  ]
}
EOF
}
