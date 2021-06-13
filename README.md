## Compactando código-fonte do Lambda

    ```
    zip lambda_function_payload.zip  *.py
    ```
    

## Removendo recursos
Para destruir um recurso, é possível fazer isso de maneiras diferentes:
    * Removendo o recurso dos arquivos (é o mais prático)
    * Comentar o bloco do recurso no arquivo
    * Pela linha de comando, especificando a referência do recurso dentro do Terraform:
       
       Exemplo:

       ```
        terraform destroy aws_instance.app_server
       ```

Importante lembrar que se um recurso A depende do recurso B, ao detruir o recurso B, automaticamente o recurso A também será destruído

### ATENÇÃO

Caso execute o destroy pela linha de comando, não esquecer de colocar o nome do recurso após o comando "terraform destroy". 
Se esquecer de mencionar o recurso, toda a Infraestrutura criada por Terraform será destruída.


## Exibindo outputs

Caso a infra já tenha sido criada, o output que for criado após não exibirá a informação desejada.
Caso queira ver mesmo assim, execute:

    ```
    terraform refresh
    ```