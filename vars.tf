variable "amis" {
  type                    = map(any)
  default                 = {
    "us-east-1"           = "ami-09e67e426f25ce0d7"
    "us-east-2"           = "..." # Quando for criar instancias EC2 de outra região
  }
}

variable "cdirs_acesso_remoto" {
  type                    = list(any)
  # Informar o IP que poderá acessar remotamente a instância EC2
  default                 = ["seu_ip"] 
}

variable "key_name" {
  type                    = string # Tipo default, não é necessário informar
  default                 = "terraform-aws"
}

variable "lambda_function_name" {
  default                 = "lambda_aws_terraform"
}

variable "lambda_function_hadler" {
  default                 = "lambda_function.lambda_handler"
}

variable "lambda_source_code_zip_name" {
  default                 = "lambda_function_payload.zip"
}

variable "bucket_name" {
  default                 = "bicmsystems-dev-from-terraform"
}

variable "lambda_role_name" {
  default                 = "iam_for_lambda"
}

variable "instance_type" {
  default                 = "t2.micro"
}

variable "terraform_organization" {
  default                 = "sua_organizacao_dentro_do_terraform_clou"
}
variavariable "terraform_cloud_workspace" {
  default                 = "sua_workspace_dentro_da_organizacao_no_terraform_cloud"
}            