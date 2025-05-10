provider "aws" {
  region     = "us-east-1"
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "ecr-container-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repository_url" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}

