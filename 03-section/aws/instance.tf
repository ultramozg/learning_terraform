resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http-alt.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # the user data which server should run
  user_data = filebase64("user_data.sh")
}

