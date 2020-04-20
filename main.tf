terraform {
    required_version = ">= 0.12, < 0.13"
}

provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "kokoon-terraform-infrastructure"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

module "web_server" {
  source = "./modules/web-server"
  server_port = var.server_port
  server_name = var.server_name
  security_group_name = var.security_group_name
}


