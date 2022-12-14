output "aws_iam_access_key_id_key_prev" {
  value = aws_iam_access_key.key_3.id
}

output "aws_iam_secret_access_key_prev" {
  value     = aws_iam_access_key.key_3.secret
  sensitive = true
}

output "aws_iam_access_key_id_key_curr" {
  value = aws_iam_access_key.key_4.id
}

output "aws_iam_secret_access_key_curr" {
  value     = aws_iam_access_key.key_4.secret
  sensitive = true
}
