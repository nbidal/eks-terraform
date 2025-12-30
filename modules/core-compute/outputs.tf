# --- EXPORTATION DES DONNÉES DU MODULE ---
# Ces valeurs seront utilisées par la racine du projet pour créer le cluster EKS.

# Exportation de l'ID du VPC
output "vpc_id" {
  description = "L'ID du VPC créé"
  value       = aws_vpc.main.id
}

# Exportation des IDs des subnets publics (sous forme de liste)
output "public_subnet_ids" {
  description = "Liste des IDs des subnets publics"
  value       = [
    aws_subnet.public_a.id, 
    aws_subnet.public_b.id, 
    aws_subnet.public_c.id
  ]
}

# Exportation des IDs des subnets privés (là où EKS sera installé)
output "private_subnet_ids" {
  description = "Liste des IDs des subnets privés"
  value       = [
    aws_subnet.private_a.id, 
    aws_subnet.private_b.id, 
    aws_subnet.private_c.id
  ]
}

# Exportation de l'ID du Security Group
output "security_group_id" {
  description = "L'ID du security group pour l'instance et EKS"
  value       = aws_security_group.main.id
}
