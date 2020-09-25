terraform {
  required_version = "~> 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.70.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "elb-setup" {
  source = "app.terraform.io/PMM-Organization/elb-setup/aws"

  name = var.name
}

module "elb-approved" {
  source = "app.terraform.io/PMM-Organization/elb-approved/aws"

  name      = var.name
  sg_id     = module.elb-setup.elb_sg_id
  subnet_id = module.elb-setup.subnet_id

  idle_timeout        = 30
  connection_draining = true
  tag_name            = "BlackFriday"

  count = 1

}
