/*
data "aws_instances" "instances" {
  instance_tags = {
      Role = "backend"
  }

  instance_state_names = ["running"]

  depends_on = [
      aws_autoscaling_group.example-autoscaling
  ]
}

output "instances_public_ip" {
  description = "Public IP address of the EC2 instances"
  value       = data.aws_instances.instances.public_ips
}
*/

output "elb_address" {
  description = "Public DNS address for elb"
  value = aws_elb.my-elb.dns_name
}