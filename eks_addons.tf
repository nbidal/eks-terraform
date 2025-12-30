# --- ADDONS EKS OBLIGATOIRES (Syllabus) ---

# 1. VPC-CNI : Gère les adresses IP des Pods dans le VPC AWS
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "vpc-cni"
  
  # On s'assure que les nodes sont prêts avant d'installer l'addon
  depends_on = [aws_eks_node_group.main]
}

# 2. CoreDNS : Gère la résolution de noms interne au cluster
resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "coredns"
  
  depends_on = [aws_eks_node_group.main]
}

# 3. Kube-proxy : Gère les règles réseau sur chaque node
resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "kube-proxy"
  
  depends_on = [aws_eks_node_group.main]
}
