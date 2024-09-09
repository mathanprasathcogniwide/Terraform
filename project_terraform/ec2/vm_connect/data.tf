data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-state-file-mathanprasath-cogniwide"
    key    = "terraform/vpc/network_a.tfstate"
    region = "us-east-1"
  }
}