resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = element(data.aws_ami_ids.ubuntu.ids, 0)
  instance_type = "t2.micro"

  network_interfaces {
    # the VPC subnet
    subnet_id = aws_subnet.main-private.id

    # the security group
    security_groups = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]
  }

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # the user data which server should run
  user_data = filebase64("user_data.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Role = "backend"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                      = "example-autoscaling"
  # TODO hardcoded , need to collect all availability zones withing this region and get one of them
  availability_zones        = ["eu-west-1a"]
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 500
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]

  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}
