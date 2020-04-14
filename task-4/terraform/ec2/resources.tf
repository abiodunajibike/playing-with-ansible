# Create a new instance of the latest Ubuntu 16.04 on an
# t2.micro node with an AWS Tag naming it "DemoInstance"

variable "instance_type" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "demo_sg_ids" {
   type = list(string)
}
variable "ssh_key_name" {}
variable "ssh_key_file_path" {}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.ssh_key_name
  public_key = file(var.ssh_key_file_path)
}

resource "aws_ssm_parameter" "ec2_ssh_key" {
  name  = "ec2_ssh_key"
  type  = "SecureString"
  value = file(var.ssh_key_file_path)
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
