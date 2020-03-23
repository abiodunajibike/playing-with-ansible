
module "networking" {
  source = "./vpc"
}

module "security" {
  source = "./security"

  vpc_id              = module.networking.vpc_id
}

module "ec2" {
  source = "./ec2"

  instance_type = var.instance_type
  vpc_id =  module.networking.vpc_id
  subnet_id = module.networking.subnet_id
  demo_sg_ids = module.security.demo_sg_ids
  ssh_key_name = var.ssh_key_name
}

