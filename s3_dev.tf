resource "aws_s3_bucket" "dev" {
  bucket      = var.bucket_name  # está em vars.tf
  acl         = "private"
  tags        = {
    Name      = var.bucket_name  # está em vars.tf
  }
}
