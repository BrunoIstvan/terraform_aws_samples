
resource "aws_lambda_permission" "allow_bucket" {
  statement_id            = "AllowExecutionFromS3Bucket"
  action                  = "lambda:InvokeFunction"
  function_name           = var.lambda_function_name
  principal               = "s3.amazonaws.com"
  source_arn              = aws_s3_bucket.dev.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket                  = aws_s3_bucket.dev.id

  lambda_function {
    lambda_function_arn   = aws_lambda_function.lambda_aws_terraform.arn
    events                = ["s3:ObjectCreated:*"]
    filter_prefix         = ""
    filter_suffix         = ""
  }

  depends_on              = [aws_lambda_permission.allow_bucket]
}