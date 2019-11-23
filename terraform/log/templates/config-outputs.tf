# --------------------------------------------------------------------------------------------------
# Outputs for Config SNS Topics.
# --------------------------------------------------------------------------------------------------

output "config_topic_arn_ap-northeast-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_ap-northeast-1.arn}"
}

output "config_topic_arn_ap-northeast-2" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_ap-northeast-2.arn}"
}

output "config_topic_arn_ap-south-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_ap-south-1.arn}"
}

output "config_topic_arn_ap-southeast-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_ap-southeast-1.arn}"
}

output "config_topic_arn_ap-southeast-2" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_ap-southeast-2.arn}"
}

output "config_topic_arn_ca-central-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_ca-central-1.arn}"
}

output "config_topic_arn_eu-central-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_eu-central-1.arn}"
}

output "config_topic_arn_eu-north-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_eu-north-1.arn}"
}

output "config_topic_arn_eu-west-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_eu-west-1.arn}"
}

output "config_topic_arn_eu-west-2" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_eu-west-2.arn}"
}

output "config_topic_arn_eu-west-3" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_eu-west-3.arn}"
}

output "config_topic_arn_sa-east-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_sa-east-1.arn}"
}

output "config_topic_arn_us-east-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_us-east-1.arn}"
}

output "config_topic_arn_us-east-2" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_us-east-2.arn}"
}

output "config_topic_arn_us-west-1" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_us-west-1.arn}"
}

output "config_topic_arn_us-west-2" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${module.config_sns_topic_us-west-2.arn}"
}
