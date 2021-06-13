
# This is to optionally manage the CloudWatch Log Group for the Lambda Function.
# If skipping this resource configuration, also add "logs:CreateLogGroup" to the IAM policy below.
resource "aws_cloudwatch_log_group" "lambda_aws_terraform_log" {
  name                  = "/aws/lambda/${var.lambda_function_name}" # está em vars.tf
  retention_in_days     = 14
}
