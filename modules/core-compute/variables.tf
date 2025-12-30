# Variable pour le nom du projet

variable "project_name" {
  description = "Nom du projet utilisé pour taguer les ressources"
  type        = string
  default     = "GROUPE-1" # Mis à jour avec le nom de ton groupe
}

# Variable pour la plage d'adresses IP du réseau

variable "vpc_cidr" {
  description = "Plage d'adresses CIDR pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}
