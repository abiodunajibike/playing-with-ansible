# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "DemoInstance"

variable "instance_type" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "demo_sg_ids" {
   type = list(string)
}
variable "ssh_key_name" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.ssh_key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHk9N/2XR/BOaFua6sEqSeqHssHdJmDnIb6Rq867UNraqBDSv9bhU/Tp8XST0vJLq1+oM4pHANNPSGAGjOhCDGiNWpto3vwzPNTuaFb/eqairTsSY4CMti5wiBiZLnqsF8g7stgPCO2DB2fgpjEO77aes/sx46B34GYzDipk20suuaDjuRBr+3YSNz8i2eMBXpaNPG6k0bghfH8/g4ioV6Wr1Byr4tbgV57mzgn/OHyD/gfKoG6ozltKqFKnGdDBW/6W/7GQV6d6Fn34kh8NPws36L3/kS6hSoivGN43IyuhwiWRHEbpsA0+v0ZNGBxOFtFjVKAAhpmrTq8y8ETQs5"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  associate_public_ip_address = true
  vpc_security_group_ids = var.demo_sg_ids
  subnet_id = var.subnet_id
  key_name = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "DemoInstance"
  }
}
