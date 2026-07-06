output "consumption_budget_management_groups" {
  description = "All consumption_budget_management_group resources"
  value       = azurerm_consumption_budget_management_group.consumption_budget_management_groups
}
output "consumption_budget_management_groups_amount" {
  description = "List of amount values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.amount]
}
output "consumption_budget_management_groups_etag" {
  description = "List of etag values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.etag]
}
output "consumption_budget_management_groups_filter" {
  description = "List of filter values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.filter]
}
output "consumption_budget_management_groups_management_group_id" {
  description = "List of management_group_id values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.management_group_id]
}
output "consumption_budget_management_groups_name" {
  description = "List of name values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.name]
}
output "consumption_budget_management_groups_notification" {
  description = "List of notification values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.notification]
}
output "consumption_budget_management_groups_time_grain" {
  description = "List of time_grain values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.time_grain]
}
output "consumption_budget_management_groups_time_period" {
  description = "List of time_period values across all consumption_budget_management_groups"
  value       = [for k, v in azurerm_consumption_budget_management_group.consumption_budget_management_groups : v.time_period]
}

