provider "aws" {
  region     = "ap-northeast-1"
 }

 module "aws-vpc" {
    source = "../vpc"
}
module "sgs" {
    source = "../sg"
    vpc_id  =  module.aws-vpc.vpcid

}
module "eks" {
    source = "../eks"
    vpc_id  =  module.aws-vpc.vpcid
    subnet_ids = [module.aws-vpc.public-subnet1,module.aws-vpc.public-subnet2]
    sg_ids = module.sgs.security_group_public
}