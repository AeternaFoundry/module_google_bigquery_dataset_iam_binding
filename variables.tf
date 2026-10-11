variable "bigquery_dataset_iam_bindings" {
  description = <<EOT
Map of bigquery_dataset_iam_bindings, attributes below
Required:
    - dataset_id
    - members
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    dataset_id = string
    members    = set(string)
    role       = string
    project    = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

