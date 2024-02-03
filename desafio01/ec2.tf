data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

  resource "aws_key_pair" "key_aula" {
    key_name   = "key_aula"
    public_key = "CHAVE_PUBLICA"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.minha_subnet.id  

  tags = {
    Name = "MinhaInstanciaEC2-02022024"
  }
}