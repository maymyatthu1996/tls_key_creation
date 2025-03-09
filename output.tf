
output "tls_private_key-private_key_openssh" {
  value     = tls_private_key.tls_test_key.private_key_openssh
  sensitive = true
}

output "tls_private_key-public_key_openssh" {
  value = tls_private_key.tls_test_key.public_key_openssh
}
