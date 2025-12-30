# Ce bloc va chercher la liste des zones de disponibilité (AZ) disponibles dans la région
# Cela permet au code de fonctionner aussi bien à Paris qu'en Irlande ou aux USA
 
data "aws_availability_zones" "available" {
  state = "available"
}

# Ce bloc cherche l'image (AMI) Amazon Linux 2023 la plus récente 

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
