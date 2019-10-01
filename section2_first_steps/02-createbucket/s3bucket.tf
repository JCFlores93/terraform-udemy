resource "aws_s3_bucket" "terraform-s3" {
  bucket = "terraform-s3-test2-yaco"
  versioning {
      enabled = true
  }
  lifecycle {
      prevent_destroy = false
  }
  tags = {
      Name = "S3 Remote store"
  }
}
