module "ec2"{
    source = "./modules/ec2"
    instancetype = "t2.small"
}
module "ecs"{
    source = "./modules/ecs"
    instancetype = "t2.small"
}
module "eks"{
    source = "./modules/eks"
    instancetype = "t2.small"
}