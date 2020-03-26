variable "instance_type" {
  default = "t2.micro"
}

variable "min_size" {
  default = 1
  type    = number
}

variable "max_size" {
  default = 2
  type    = number
}

variable "desired_size" {
  default = 2
  type    = number
}

variable "ssh_key_name" {
  default = "ansible-keypair"
}

variable "ssh_key_file_path" {
  default = "/Users/moruf/.ssh/ansible-keypair.pub"
}
