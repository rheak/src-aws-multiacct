output "flowlogs_cwl_destination_arn" {
  description = "The arn of the destination policy"
  value       = "${aws_cloudwatch_log_destination.flowlogs_cwl_destination.arn}"
}
