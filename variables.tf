variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "name" {
  description = "Desired name for each ELB"
  default     = "Demo"
}

variable "subnet_cidr" {
  description = "Desired default subnet CIDR for the instances to live"
  default     = "10.0.1.0/24"
}

variable "elb_count" {
  description = "Desired count of ELBs to deploy"
  default     = "1"
}
