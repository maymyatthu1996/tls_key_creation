# RSA key of size 4096 bits
resource "tls_private_key" "tls_test_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "dev_ec2_publickey" {
  key_name   = "dev-ec2-publickey"
  public_key = tls_private_key.tls_test_key.public_key_openssh
}

resource "local_file" "hc_private_key" {
  content  = tls_private_key.tls_test_key.private_key_openssh
  filename = "${path.module}/generated/dev_private_key.pem"

  provisioner "local-exec" {
    command = "chmod 400 ${path.module}/generated/dev_private_key.pem"
  }
}
