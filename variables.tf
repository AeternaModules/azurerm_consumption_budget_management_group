variable "consumption_budget_management_groups" {
  description = <<EOT
Map of consumption_budget_management_groups, attributes below
Required:
    - amount
    - management_group_id
    - name
    - notification (block):
        - contact_emails (required)
        - enabled (optional)
        - operator (required)
        - threshold (required)
        - threshold_type (optional)
    - time_period (block):
        - end_date (optional)
        - start_date (required)
Optional:
    - etag
    - time_grain
    - filter (block):
        - dimension (optional, block):
            - name (required)
            - operator (optional)
            - values (required)
        - tag (optional, block):
            - name (required)
            - operator (optional)
            - values (required)
EOT

  type = map(object({
    amount              = number
    management_group_id = string
    name                = string
    etag                = optional(string)
    time_grain          = optional(string) # Default: "Monthly"
    notification = list(object({
      contact_emails = list(string)
      enabled        = optional(bool) # Default: true
      operator       = string
      threshold      = number
      threshold_type = optional(string) # Default: "Actual"
    }))
    time_period = object({
      end_date   = optional(string)
      start_date = string
    })
    filter = optional(object({
      dimension = optional(object({
        name     = string
        operator = optional(string) # Default: "In"
        values   = list(string)
      }))
      tag = optional(object({
        name     = string
        operator = optional(string) # Default: "In"
        values   = list(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.consumption_budget_management_groups : (
        length(v.notification) >= 1
      )
    ])
    error_message = "Each notification list must contain at least 1 items"
  }
}

