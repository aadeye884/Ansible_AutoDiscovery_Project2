#S3 Bucket for Backend
resource "aws_s3_bucket" "efgv1" {
  bucket        = var.bucket_name
  force_destroy = true
  tags = {
    Name = var.bucket_name
  }
}
#S3 Bucket Access Control List
resource "aws_s3_bucket_acl" "backend_bucket_acl" {
  bucket = var.bucket_name
  acl    = var.acl
}
################
# DYNAMODB TABLE
################
resource "aws_dynamodb_table" "EFG-TFlockv1" {
  name     = var.table_name
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  write_capacity = 1
  read_capacity  = 1
  tags = {
    Name        = "TF-State-Lockv9"
    Environment = "Terraform"
  }
}