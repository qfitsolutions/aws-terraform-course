module "ec2"{
    source = "./modules/ec2"
    instancetype = "t2.small"
}
module "ecs"{
    source = "./modules/ecs"
}
module "eks"{
    source = "./modules/eks"
}