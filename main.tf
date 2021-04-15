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
  # Module can be sourced at: https://github.com/kmruddy/terraform-aws-elb-setup
  source  = "app.terraform.io/TFTMM-Dev/elb-setup/aws"
  version = "0.0.1"
  
  name = var.name
}

module "elb-approved" {
  # Module can be sourced at: https://github.com/kmruddy/terraform-aws-elb-approved
  source  = "app.terraform.io/TFTMM-Dev/elb-approved/aws"
  version = "0.0.1"
  
  name      = var.name
  sg_id     = module.elb-setup.elb_sg_id
  subnet_id = module.elb-setup.subnet_id

  idle_timeout        = 30
  connection_draining = true
  tag_name            = "BlackFriday"

  count = var.elb_count
}
