include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//gitlab-variables/."
}

dependency "secrets" {
  config_path = "../secret_idp"
  mock_outputs = {
    aws_iam_access_key_id_key_curr = "placeholder"
    aws_iam_secret_access_key_curr = "placeholder"
  }
}

inputs = {
  gitlab_project_id     = "roberto.giova/roll_n_review"
  gitlab_variable_key   = dependency.secrets.outputs.aws_iam_access_key_id_key_curr
  gitlab_variable_value = dependency.secrets.outputs.aws_iam_secret_access_key_curr
}
