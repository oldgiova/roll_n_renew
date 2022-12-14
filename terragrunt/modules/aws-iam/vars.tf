variable "aws_iam_user_name" {
  description = "AWS IAM user name"
  type        = string
}

variable "aws_iam_user_description" {
  description = "AWS IAM user description"
  type        = string
  default     = "AWS IAM User cicd"
}
