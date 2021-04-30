variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMI_NAME" {
  default = "ubuntu-minimal/images/hvm-ssd/ubuntu-focal-20.04-amd64-minimal-*"
}

data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = [var.AMI_NAME]
  }
}
