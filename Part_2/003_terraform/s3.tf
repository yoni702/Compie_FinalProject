

#1 -this will create a S3 bucket in AWS
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state"
  region         = var.region
  force_destroy = true
  lifecycle {
    prevent_destroy = true
  }
# Enable versioning to see full revision history of our state files
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






