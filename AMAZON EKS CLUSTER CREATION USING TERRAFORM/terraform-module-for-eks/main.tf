module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  # TODO define vpc name, vpc cidr using corresponding variables

  # TODO define two availability zones from your region
  azs             = local.azs

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  # TODO define cluster_name and cluster_version using corresponding variables

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
    instance_types = ["t3.small"]
  }

  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version


  eks_managed_node_groups = {
    firstnode = {
      name            = "node-group-1"
      use_name_prefix = true

      subnet_ids = module.vpc.private_subnets

      min_size     = 1
      max_size     = 3
      desired_size = 2
      }
      
    secondnode = {
      name            = "node-group-2"
      use_name_prefix = true

      subnet_ids = module.vpc.private_subnets

      min_size     = 1
      max_size     = 2
      desired_size = 1
      }
  }
}