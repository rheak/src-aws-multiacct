variable "cwl_destination_name" {
  description = "The name of the Kinesis Stream used to deliver AWS FlowLogs"
}

variable "CWL_To_Kinesis_role_arn" {
  description = "The ARN for the IAM Role used to deliver AWS Flow Logs from CloudWatch Logs to Kinesis"
}

variable "cwl_kinesis_stream_arn" {
  description = "The ARN for the Kinesis Stream where the CloudWatchLogs Destination will deliver"
}

variable "accts_list" {
  description = "The of account ids for all accounts in the organization"
  type        = "list"
}
