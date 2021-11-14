

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks"
  cluster_version = "1.17"
  subnets         = ["subnet-06acb22f7edfdd754", "subnet-009974158ec3d4870"]
  vpc_id          = aws_vpc.masteroll.id

  node_groups = {
    public = {
      subnets          = ["subnet-06acb22f7edfdd754"]
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t2.small"
      k8s_labels = {
        Environment = "public"
      }
    }
    private = {
      subnet_ids = [aws_subnet.masteroll-public-1.id, aws_subnet.masteroll-public-2.id]
      subnets          = ["subnet-009974158ec3d4870"]
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t2.small"
      k8s_labels = {
        Environment = "private"
      }
    }
  }

}