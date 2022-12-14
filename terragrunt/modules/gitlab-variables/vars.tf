variable "gitlab_project_id" {
  type        = string
  description = "Gitlab Project id or path"
}

variable "gitlab_variable_key" {
  type        = string
  description = "Gitlab variable"
}

variable "gitlab_variable_value" {
  type        = string
  description = "Gitlab variable value"
}

variable "gitlab_variable_protected" {
  type        = bool
  description = "Gitlab protected variable"
  default     = true
}

variable "gitlab_pat" {
  type        = string
  description = "Gitlab Personal Access Token"
}
