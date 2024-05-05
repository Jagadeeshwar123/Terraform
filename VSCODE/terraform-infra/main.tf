resource "aws_s3_bucket" "s3_bucket" {
    bucket = "infra-ex"
}

resource "aws_dynamodb_table" "infra-lock" {
  name           = "infra-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}