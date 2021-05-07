terraform {
  backend "s3" {
    bucket = "terraform-state-01"
    key    = "learning_terraform/terraform-section3.tfstate"
    region = "us-east-2"
  }
}
