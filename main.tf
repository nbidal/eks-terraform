provider "aws" {
  region = var.region
}

module "core_compute" {
  source       = "./modules/core-compute"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}
