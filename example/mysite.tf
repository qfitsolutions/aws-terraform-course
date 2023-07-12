module "s3"{
    source = "./modules/s3"
}
# module "ecs"{
#     source = "./modules/ecs"
# }
# module "eks"{
#     source = "./modules/eks"
#     rolearn = "arn:aws:iam::675467602881:role/eksClusterRole"
# }