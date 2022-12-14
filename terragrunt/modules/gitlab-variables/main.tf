data "gitlab_project" "this" {
  id = var.gitlab_project_id
}

resource "gitlab_project_variable" "this" {
  project   = data.gitlab_project.this.id
  key       = var.gitlab_variable_key
  value     = var.gitlab_variable_value
  protected = var.gitlab_variable_protected
}
