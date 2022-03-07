provider "aws" {
    region = "us-east-1"
    #shared_credentials_file = "/root/.aws/credentials"
    profile = "david-terraform"
}

module "ec2_module" {
   source = "./ec2_module"
  
}