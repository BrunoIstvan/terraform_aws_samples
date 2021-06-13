
# Criando um lambda já com código-fonte sendo enviado
resource "aws_lambda_function" "lambda_aws_terraform" {
  filename                  = var.lambda_source_code_zip_name # está em vars.tf
  function_name             = var.lambda_function_name        # está em vars.tf
  role                      = aws_iam_role.iam_for_lambda.arn # está em iam_roles.tf
  handler                   = var.lambda_function_hadler      # está em vars.tf
  source_code_hash          = filebase64sha256(var.lambda_source_code_zip_name)
  runtime                   = "python3.8"

  # Configurando variáveis de ambiente
  environment {
    variables               = {
      BUCKET_GLOBAL_BKP     = "bicmsystems-s3-poc-bkp"
      BUCKET_PROCESS        = "bicmsystems-s3-process-poc"
    }

  }

  # Esse lambda só será criado depois da criação dessas polices
  depends_on                = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.lambda_aws_terraform_log,
  ]

}

# Está linha permite vincular a police de gravacao de logs no cloudwatch com a role do lambda
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role                      = aws_iam_role.iam_for_lambda.name
  policy_arn                = aws_iam_policy.lambda_logging.arn
}


# Está linha permite vincular a police de acesso ao S3 com a role do lambda
resource "aws_iam_role_policy_attachment" "lambda_s3" {
  role                      = aws_iam_role.iam_for_lambda.name
  policy_arn                = aws_iam_policy.lambda_access_bucket.arn
}
