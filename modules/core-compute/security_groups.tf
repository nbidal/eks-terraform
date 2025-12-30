# --- GROUPE DE SÉCURITÉ (PARE-FEU) ---
# Ce bloc crée le pare-feu virtuel qui filtrera le trafic pour nos instances.

resource "aws_security_group" "main" {
  name        = "${var.project_name}-sg"
  description = "Autorise SSH, HTTP et HTTPS pour le projet EKS"
  vpc_id      = aws_vpc.main.id # On attache le SG au VPC créé à l'étape 1

  # --- RÈGLES D'ENTRÉE (INGRESS) ---

  # Autorisation du SSH (Port 22) : Pour l'administration à distance
  ingress {
    description      = "SSH depuis Internet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # "toutes IPs" comme exigé 
  }

  # Autorisation du HTTP (Port 80) : Pour l'accès web standard
  ingress {
    description      = "HTTP depuis Internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # "toutes IPs" comme exigé 
  }

  # Autorisation du HTTPS (Port 443) : Pour l'accès web sécurisé
  ingress {
    description      = "HTTPS depuis Internet"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # "toutes IPs" comme exigé 
  }

  # --- RÈGLE DE SORTIE (EGRESS) ---

  # Autorisation de TOUTE la sortie (Egress)
  # Indispensable pour que les serveurs puissent télécharger des mises à jour ou contacter EKS
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Signifie "Tous les protocoles"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-security-group"
  }
}
