

resource "aws_instance" "server_1" {
  ami = "ami-08cd358d745620807"
  instance_type = "t3.small"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Kyle-TerraformAppServerInstance-1"
    source = "terraform"
  }
}

resource "aws_instance" "server_2" {
  ami = "ami-08cd358d745620807"
  instance_type = "t3.small"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Kyle-TerraformAppServerInstance-2"
    source = "terraform"
  }
}

resource "aws_instance" "server_3" {
  ami = "ami-08cd358d745620807"
  instance_type = "t3.small"
  availability_zone = "eu-west-2c"

  tags = {
    Name = "Kyle-TerraformAppServerInstance-3"
    source = "terraform"
  }
}