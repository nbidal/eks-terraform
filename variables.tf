variable "region" {
  description = "Région AWS où déployer les ressources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nom du projet utilisé pour le nommage"
  type        = string
  default     = "GROUPE-1"
}

variable "vpc_cidr" {
  description = "Plage d'adresses IP pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}