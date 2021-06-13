resource "aws_security_group" "acesso-ssh" {

  # Quando uma security_group necessitar ser criada em outras regiões, basta mudar apontando para o alias da região em questão
  # Como essa região é default, deixarei desabilitado
  # provider      = aws.us-east-1 
  name                = "acesso-ssh"
  ingress {
    from_port         = "22"
    to_port           = "22"
    protocol          = "tcp"
    cidr_blocks       = var.cdirs_acesso_remoto # Variável declarada no arquivo vars.tf
  }
  tags                = {
    "Name"            = "ssh"
  }
}
