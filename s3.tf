resource "aws_s3_bucket" "bucket" {
  bucket = "kyle-terraform-bucket"
  
  tags = {
    Name = "Kyle Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl = "private"
}

# resource "aws_s3_bucket_lifecycle_configuration" "bucket_lc" {
  
# }