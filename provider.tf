provider "aws" {

  profile         = "default"
  region          = "us-east-1"

  # O alias é usado para referenciar nos recursos qual a região que será criado. 
  # Caso tenha apenas uma região, o alias não é necessário
  # Como essa região é default, deixarei desabilitado
  # alias         = "us-east-1" 

}


# provider "aws" {

#   profile       = "default"
#   region        = "us-east-2"

#   # O alias é usado para referenciar nos recursos qual a região que será criado. 
#   # Caso tenha apenas uma região, o alias não é necessário
#   alias         = "us-east-2" 

# }