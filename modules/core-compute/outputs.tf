output "vpc_id" {
  description = "L'ID du VPC créé"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Liste des IDs des subnets publics"
  value       = [
    aws_subnet.public_a.id, 
    aws_subnet.public_b.id, 
    aws_subnet.public_c.id
  ]
}

output "private_subnet_ids" {
  description = "Liste des IDs des subnets privés"
  value       = [
    aws_subnet.private_a.id, 
    aws_subnet.private_b.id, 
    aws_subnet.private_c.id
  ]
}

output "security_group_id" {
  description = "L'ID du security group pour l'instance et EKS"
  value       = aws_security_group.main.id
}
