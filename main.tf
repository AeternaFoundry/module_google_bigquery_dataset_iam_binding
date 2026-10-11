resource "google_bigquery_dataset_iam_binding" "bigquery_dataset_iam_bindings" {
  for_each = var.bigquery_dataset_iam_bindings

  dataset_id = each.value.dataset_id
  members    = each.value.members
  role       = each.value.role
  project    = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

