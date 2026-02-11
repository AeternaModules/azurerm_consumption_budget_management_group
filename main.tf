resource "azurerm_consumption_budget_management_group" "consumption_budget_management_groups" {
  for_each = var.consumption_budget_management_groups

  amount              = each.value.amount
  management_group_id = each.value.management_group_id
  name                = each.value.name
  etag                = each.value.etag
  time_grain          = each.value.time_grain

  dynamic "notification" {
    for_each = each.value.notification
    content {
      contact_emails = notification.value.contact_emails
      enabled        = notification.value.enabled
      operator       = notification.value.operator
      threshold      = notification.value.threshold
      threshold_type = notification.value.threshold_type
    }
  }

  time_period {
    end_date   = each.value.time_period.end_date
    start_date = each.value.time_period.start_date
  }

  dynamic "filter" {
    for_each = each.value.filter != null ? [each.value.filter] : []
    content {
      dynamic "dimension" {
        for_each = filter.value.dimension != null ? [filter.value.dimension] : []
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
      dynamic "tag" {
        for_each = filter.value.tag != null ? [filter.value.tag] : []
        content {
          name     = tag.value.name
          operator = tag.value.operator
          values   = tag.value.values
        }
      }
    }
  }
}

