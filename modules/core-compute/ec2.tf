# --- INSTANCE EC2 AMAZON LINUX 2023 ---
# Cette ressource crée la machine virtuelle demandée dans le sujet.
# Elle est incluse dans le module "core-compute" comme exigé[cite: 48, 51].

resource "aws_instance" "bastion" {
  # Utilisation de l'AMI récupérée dynamiquement dans data.tf
  # Cela garantit d'avoir Amazon Linux 2023 peu importe la région[cite: 33, 37].
  ami           = data.aws_ami.amazon_linux_2023.id
  
  # Type d'instance imposé par le sujet 
  instance_type = "t2.micro"

  # On place l'instance dans l'un de nos subnets publics pour qu'elle soit accessible
  subnet_id     = aws_subnet.public_a.id

  # On attache le Security Group (SSH, HTTP, HTTPS) créé à l'étape précédente [cite: 38, 52]
  vpc_security_group_ids = [aws_security_group.main.id]

  # Attribution d'une IP publique automatique pour l'accès SSH
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-ec2-instance"
  }
}
