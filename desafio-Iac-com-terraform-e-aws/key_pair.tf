# Busca pelo seu Key Pair "parchave-vinciussantos" que já existe na sua conta AWS.
# O Terraform usará este nome para associar a chave às instâncias EC2.
data "aws_key_pair" "minha_chave" {
  key_name = "parchave-vinciussantos"
}

# Exemplo de como usar sua chave em uma instância EC2:
# (Descomente e ajuste conforme sua necessidade)

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Exemplo de AMI (Ubuntu)
  instance_type = "t2.micro"

  # Associa a instância com o seu key pair existente
  key_name = data.aws_key_pair.minha_chave.key_name

  tags = {
    Name = "Exemplo-com-chave-existente"
  }
}
