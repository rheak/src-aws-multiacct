variable "loggroup_name" {
  description = "The name of the CloudWatch Logs Log Group for AWS VPC Flow Logs"
  default     = "FlowLogs"
}

variable "retention_in_days" {
  description = "The number of days logs will be retained in the CloudWatch Logs Log Group"
  default     = "7"
}

variable "subscription_name" {
  description = "The Name of the CloudWatch Logs Subscription Filter"
  default     = "FlowLogs-Subscription"
}

variable "subscription_destination_arn" {
  description = "The ARN of the CloudWatch Logs Destination in the Logging Account where logs will be sent."
}
