data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-state-file-mathanprasath-cogniwide"
    key    = "terraform/vpc/vpc.tfstate"
    region = "us-east-1"
  }
}