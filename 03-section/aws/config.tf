terraform {
  backend "s3" {
    bucket = "terraform-state-01"
    key    = "learning_terraform/terraform-03section.tfstate"
    region = "us-east-2"
  }
}
