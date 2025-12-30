# --- 1. LE CLUSTER EKS (Control Plane) ---
resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    # On utilise les subnets créés par notre module core-compute
    # On met le "cerveau" d'EKS sur les subnets publics et privés pour l'accès API
    subnet_ids = concat(module.core_compute.public_subnet_ids, module.core_compute.private_subnet_ids)
    
    # On lie le Security Group créé dans le module
    security_group_ids = [module.core_compute.security_group_id]
  }

  # On s'assure que les rôles IAM sont créés AVANT le cluster
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

# --- 2. LE NODE GROUP (Les serveurs de calcul) ---
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-nodes"
  node_role_arn   = aws_iam_role.eks_nodes_role.arn
  
  # IMPORTANT : On place les nodes dans les SUBNETS PRIVÉS pour la sécurité
  # C'est une excellente pratique pour ton projet.
  subnet_ids      = module.core_compute.private_subnet_ids

  # Configuration des serveurs
  instance_types = ["t2.micro"] # Economique pour le projet

  scaling_config {
    desired_size = 2 # On lance 2 serveurs
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # On s'assure que les politiques IAM des nodes sont prêtes
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]
}
