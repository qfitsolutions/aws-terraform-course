module "ec2"{
    source = "./modules/ec2"
    instancetype = "t2.small"
}
# module "ecs"{
#     source = "./modules/ecs"
# }
# module "eks"{
#     source = "./modules/eks"
#     rolearn = "arn:aws:iam::675467602881:role/eksClusterRole"
# }