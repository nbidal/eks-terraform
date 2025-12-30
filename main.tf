# 1. Configuration du Provider AWS
# On reprend la structure de ton fichier de cours
provider "aws" {
  region = var.region
}

# 2. Appel du module local "core-compute"
# Conformément au sujet, on utilise le module pour créer la base du réseau [cite: 48, 53]
module "core_compute" {
  source       = "./modules/core-compute"
  
  # On transmet les variables du projet au module
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}
