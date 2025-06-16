resource "random_password" "db_password" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# output "name" {
#   value = random_password.db_password.result
#   sensitive = true
# }

# resource "aws_secretsmanager_secret" "db_password" {
#   name = "db_password_1"
# }

# resource "aws_secretsmanager_secret_version" "db_password" {
#   secret_id                = aws_secretsmanager_secret.db_password.id
#   secret_string            = random_password.db_password.result
# }


  