module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "provectus"
  cidr = "172.31.0.0/16"

  azs             = ["eu-central-1a", "eu-centralest-1b", "eu-central-1c"]
  private_subnets = ["172.31.0.1/24", "172.31.0.2/24", "172.31.0.3/24"]
  public_subnets  = ["172.31.101.0/24", "172.31.102.0/24", "172.31.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_az = false
  enable_vpn_gateway = true
  reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = "${aws_eip.nat.*.id}"   # <= IPs specified here as input to the module


  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

  
resource "aws_eip" "nat" {
  count = 3

  vpc = true
}
