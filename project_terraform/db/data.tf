data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-state-file-mathanprasath-cogniwide"
    key    = "terraform/vpc/network_b.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ec2" {
  backend = "s3"

   config = {
    bucket = "terraform-state-file-mathanprasath-cogniwide"
    key    = "terraform/ec2/vm_app_1.tfstate"
    region = "us-east-1"
  }
}