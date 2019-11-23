output "ct_s3_bucket" {
  description = "Name of CloudTrail Bucket"
  value       = "${aws_s3_bucket.ct_s3_bucket.id}"
}

output "ct_s3_bucket_arn" {
  description = "ARN of CloudTrail Bucket"
  value       = "${aws_s3_bucket.ct_s3_bucket.arn}"
}

output "kms_key_cloudtrail_arn" {
  description = "ARN of Config Bucket"
  value       = "${aws_kms_key.cloudtrail.arn}"
}

output "config_s3_bucket" {
  description = "Name of Config Bucket"
  value       = "${aws_s3_bucket.config_s3_bucket.id}"
}

output "config_s3_bucket_arn" {
  description = "ARN of Config Bucket"
  value       = "${aws_s3_bucket.config_s3_bucket.arn}"
}

output "config_topic_id" {
  description = "The Name of the SNS topic that AWS Config delivers notifications to."
  value       = "${var.config_sns_topic_name}"
}
