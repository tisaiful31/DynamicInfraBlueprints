data "aws_caller_identity" "current" {}

provider "aws" {
  alias = "virginia"
  region = "us-east-1"
  version = ">= 5.0"
}
terraform {
  backend "s3" {
    bucket = "tfstate-bucket"
    key = "keyfiles"
    region = "us-east-1"
    dynamodb_table = "tfstate-bucket"
  }
}