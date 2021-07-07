module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "provectus"
  cidr = "172.31.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["172.31.0.1/24", "172.31.0.2/24", "172.31.0.3/24"]
  public_subnets  = ["172.31.101.0/24", "172.31.102.0/24", "172.31.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
