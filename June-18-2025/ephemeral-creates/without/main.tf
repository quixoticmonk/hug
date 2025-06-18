resource "random_password" "db_password" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_string" "rs" {
  length = 4
  special = false
}

# output "name" {
#   value = random_password.db_password.result
#   sensitive = true
# }

# resource "aws_secretsmanager_secret" "db_password" {
#   name = "db_password_${random_string.rs.result}"
# }

# resource "aws_secretsmanager_secret_version" "db_password" {
#   secret_id                = aws_secretsmanager_secret.db_password.id
#   secret_string            = random_password.db_password.result
# }


  