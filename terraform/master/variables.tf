# --------------------------------------------------------------------------------------------------
# Variables for Organizations Accounts
# --------------------------------------------------------------------------------------------------
variable "org_name" {
  description = "The name of the organization deploying Secure Multi Account Provisioning"
}

variable "profile" {
  description = "The AWS Boto Profile for the Master Account Provisioner to be used in the main provider configuration"
  default = "default"
}

variable "main_region" {
  description = "The AWS Region for the Master Account Provisioner to be used in the main provider configuration"
  default = "us-east-1"
}

variable "aws_plugin_version" {
  description = "The AWS Terraform Provider Plug-In Version"
}

variable "provisioner_account_name" {
  description = "The Name of the IAM user Created in the Master Account for Provisioning"
  default = "Provisioner"
}

variable "guardduty_master" {
  description = "Provide the name of the AWS Account that will serve as the GuardDuty Master (Security Account is recommended)"
}

# --------------------------------------------------------------------------------------------------
# Variables for Organizations Accounts
# --------------------------------------------------------------------------------------------------
variable "master_acct" {
type = "map"
}

variable "member_accts" {
type = "map"
}

# --------------------------------------------------------------------------------------------------
# Variables for Cloud Trail
# --------------------------------------------------------------------------------------------------
variable "ct_name" {
type        = "string"
description = "The trail name"
default     = "organization_cloudtrail"
}

# --------------------------------------------------------------------------------------------------
# Variables for flowlogs.
# --------------------------------------------------------------------------------------------------
variable "FlowLogsCWL_iam_role_name" {
  type        = "string"
  description = "The name of the IAM role used to deliver VPC FlowLogs to CloudWatch Logs"
  default     = "FlowLogs-To-CWL-Role"
}

variable "FlowLogsCWL_iam_policy_name" {
  type        = "string"
  description = "The name of the IAM policy used by the VPC FlowLogs IAM Role"
  default     = "FlowLogs-To-CWL-Policy"
}

variable "CWLKinesis_iam_role_name" {
  type        = "string"
  description = "The name of the IAM role used to deliver VPC FlowLogs from CloudWatch Logs to Kinesis Streams"
  default     = "CWL-To-Kinesis-Role"
}

variable "CWLKinesis_iam_policy_name" {
  type        = "string"
  description = "The name of the IAM policy used by the CWLKinesis IAM Role"
  default     = "CWL-To-Kinesis-Policy"
}

variable "flowlogs_loggroup_name" {
  description = "The name of the CloudWatch Logs Log Group for AWS VPC Flow Logs"
  default     = "FlowLogs"
}

variable "flowlogs_subscription_name" {
  description = "The Name of the CloudWatch Logs Subscription Filter"
  default     = "FlowLogs-Subscription"
}

# --------------------------------------------------------------------------------------------------
# Variables for config-baseline module.
# --------------------------------------------------------------------------------------------------

variable "config_delivery_frequency" {
  description = "The frequency which AWS Config sends a snapshot into the S3 bucket."
  default     = "One_Hour"
}

variable "config_iam_role_name" {
  description = "The name of the IAM Role which AWS Config will use."
  default     = "Config-Recorder-Role"
}

variable "config_iam_role_policy_name" {
  description = "The name of the IAM Role Policy which AWS Config will use."
  default     = "Config-Recorder-Policy"
}

variable "config_s3_bucket_key_prefix" {
  description = "The prefix used when writing AWS Config snapshots into the S3 bucket."
  default     = ""
}

# --------------------------------------------------------------------------------------------------
# Variables for iam password policy.
# --------------------------------------------------------------------------------------------------

variable "iam_require_uppercase_characters" {
  description = "Require at least one uppercase letter in passwords"
  default     = true
}

variable "iam_require_lowercase_characters" {
  description = "Require at least one lowercase letter in passwords"
  default     = true
}

variable "iam_require_symbols" {
  description = "Require at least one symbol in passwords"
  default     = true
}

variable "iam_require_numbers" {
  description = "Require at least one number in passwords"
  default     = true
}

variable "iam_minimum_password_length" {
  description = "Require minimum lenght of password"
  default     = 14
}

variable "iam_password_reuse_prevention" {
  description = "Prevent password reuse N times"
  default     = 24
}

variable "iam_max_password_age" {
  description = "Passwords expire in N days"
  default     = 90
}

variable "iam_allow_users_to_change_password" {
  description = "Can users change their own password"
  default     = true
}

variable "iam_hard_expiry" {
  description = "Everyone needs hard reset for expired passwords"
  default     = true
}
