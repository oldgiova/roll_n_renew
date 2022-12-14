include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//aws-iam/."
}

inputs = {
  aws_iam_user_name        = "giova-ciccio-user"
  aws_iam_user_description = "Ciccio Secret User"
}
