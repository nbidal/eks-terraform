variable "private_key_path" {
  type    = string
  default = "./grp1_ssh_key.pem"
}

variable "project_name" {
  description = "Nom du projet utilisé pour taguer les ressources"
  type        = string
  default     = "GROUPE-1"
}

variable "vpc_cidr" {
  description = "Plage d'adresses CIDR pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}