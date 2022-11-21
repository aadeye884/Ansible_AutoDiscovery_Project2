# provider "aws" {
#     region = "us-east-1"
#     profile = "personal"
#     shared_credentials_files = "~/.aws/credentials"
# }

# terraform {
#   backend "s3" {
#     bucket         = "efgv1"
#     key            = "dev/terraform.tfstate"
#     region         = "us-east-1"
#     profile        =  "personal"
#     dynamodb_table = "EFG-TFlockv9"
#   }
# }