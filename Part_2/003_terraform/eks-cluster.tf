module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.21"
  subnets         = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]

  tags = {
    Environment = "yoni"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      spot_price                    = "0.199"
      instance_type                 = "t2.small"
      additional_userdata           = "echo foo bar"
      asg_max_size                  = 10
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      kubelet_extra_args            = "--node-labels=node.kubernetes.io/lifecycle=spot"
      suspended_processes           = ["AZRebalance"]
    },
    {
      name                          = "worker-group-2"
      spot_price                     = "0.20"
      instance_type                 = "t2.medium"
      asg_max_size                  = 10
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      kubelet_extra_args            = "--node-labels=node.kubernetes.io/lifecycle=spot"
      suspended_processes           = ["AZRebalance"]
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}