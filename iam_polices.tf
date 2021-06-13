
# Aqui é criada uma police que permite gravar stream no cloudwatch log
resource "aws_iam_policy" "lambda_logging" {
  name                        = "lambda_logging"
  path                        = "/"
  description                 = "IAM policy for logging from a lambda"

  policy                      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}



# Aqui é criada uma police que permite lista, gravar e apagar objeto no S3
resource "aws_iam_policy" "lambda_access_bucket" {
  name                        = "lambda_access_bucket"
  path                        = "/"
  description                 = "IAM policy for S3 access from a lambda"

  policy                      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::*",
      "Effect": "Allow"
    }
  ]
}
EOF
}