# 1. Création du VPC (Virtual Private Cloud)
# C'est le réseau privé isolé où toute l'infrastructure sera déployée
resource "aws_vpc" "main" {

  cidr_block           = var.vpc_cidr 
  
  # L'instance_tenancy définit le type de matériel physique utilisé.
  # "default" signifie que les instances tournent sur du matériel partagé avec d'autres clients AWS.

  instance_tenancy     = "default"

  # Recommandé pour le bon fonctionnement d'EKS et des Load Balancers
  enable_dns_hostnames = true 
  enable_dns_support   = true

  # Utilisation d'une variable pour le nommage afin de faciliter l'identification
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# 2. Création de l'Internet Gateway (IGW)
# Cette ressource permet à ton VPC de communiquer avec Internet.
resource "aws_internet_gateway" "igw" {
  # On lie l'IGW au VPC créé ci-dessus via son identifiant unique (.id)

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}
