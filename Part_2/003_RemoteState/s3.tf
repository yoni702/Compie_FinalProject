provider "aws" {
  region = "us-east-2"
}

#1 -this will create a S3 bucket in AWS
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state"
  region         = "us-east-2"
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

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "app-state"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}






