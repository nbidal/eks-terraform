# Variable pour la région AWS
# On reprend la structure de ton cours
variable "region" {
  description = "Région AWS où déployer les ressources"
  type        = string
  default     = "us-east-1" # Tu peux mettre la région que tu utilises (ex: eu-west-3 pour Paris)
}

# Variable pour le nom du projet (pour la cohérence avec le module)
variable "project_name" {
  description = "Nom du projet utilisé pour le nommage"
  type        = string
  default     = "GROUPE-1"
}

# Variable pour le CIDR du VPC
variable "vpc_cidr" {
  description = "Plage d'adresses IP pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}
