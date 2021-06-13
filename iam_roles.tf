# Criando uma role para ser usado por um lambda
resource "aws_iam_role" "iam_for_lambda" {
  name                  = var.lambda_role_name  # está em vars.tf

  assume_role_policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}