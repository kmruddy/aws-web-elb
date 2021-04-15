output "elb_name" {
  description = "ELB Name"
  value       = aws_elb.web.name
}

output "elb_sg" {
  description = "ELB Security Group Name"
  value       = aws_elb.web.source_security_group
}
