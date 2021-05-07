resource "aws_instance" "example" {
  ami           = element(data.aws_ami_ids.ubuntu.ids, 0)
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  
  tags = {
    Role = "test-codedeploy"
  }
}

