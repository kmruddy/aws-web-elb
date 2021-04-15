output "elb_name" {
  description = "ELB Name"
  value       = module.elb-approved[0].aws_elb.web.name
}

output "elb_sg" {
  description = "ELB Security Group Name"
  value       = module.elb-approved[0].aws_elb.web.source_security_group
}
