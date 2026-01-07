resource "tls_private_key" "grp1_ssh_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "grp1_ssh_key" {
    key_name   = "grp1_key_ssh"
    public_key = tls_private_key.grp1_ssh_key.public_key_openssh
}

resource "local_file" "grp1_ssh_key" {
    filename        = "${aws_key_pair.grp1_ssh_key.key_name}.pem"
    content         = tls_private_key.grp1_ssh_key.private_key_pem
    file_permission = "0600"
}