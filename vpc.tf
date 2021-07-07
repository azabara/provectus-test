module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "provectus"
  cidr = "172.31.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["172.31.0.0/16"]
  public_subnets  = ["172.31.0.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
