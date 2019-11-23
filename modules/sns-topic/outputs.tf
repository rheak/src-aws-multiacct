output "arn" {
  description = "The ARN of the SNS topic that AWS Config delivers notifications to."
  value       = "${aws_sns_topic.config.id}"
}
