resource "aws_instance" "app_server" {

  # Quando uma instância necessitar ser criada em outras regiões, basta mudar apontando para o alias da região em questão
  # Como essa região é default, deixarei desabilitado
  # provider                    = aws.us-east-1 
  count                         = 1
  ami                           = var.amis["us-east-1"] # Variável declarada no arquivo vars.tf
  instance_type                 = var.instance_type  # Variável declarada no arquivo vars.tf
  key_name                      = var.key_name # Variável declarada no arquivo vars.tf
  tags                          = {
    Name                        = "app_server_${count.index}"
  }
  vpc_security_group_ids        = ["${aws_security_group.acesso-ssh.id}"]
  # essa propriedade pode usada para criar uma dependência na criação desse recurso. 
  # Nesse caso o EC2 só será criado após a criação do Bucket especificado
  # Caso o Bucket seja destruído, esse recurso EC2 também será destruído automaticamente
  # depends_on                  = [aws_s3_bucket.dev]

}
