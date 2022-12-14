resource "aws_iam_user" "default" {
  name = var.aws_iam_user_name
  path = "/system/"
  tags = {
    description = var.aws_iam_user_description
  }
}

resource "aws_iam_access_key" "key_3" { #prev
  user   = aws_iam_user.default.name
  status = "Inactive"
}

resource "aws_iam_access_key" "key_4" { #curr
  user = aws_iam_user.default.name
}

