# --------------------------------------------------------------------------------------------------
# Outputs for flowlogs CloudWatch Logs Destinations.
# --------------------------------------------------------------------------------------------------

output "flowlogs_cwl_dest_ap-northeast-1" {
  description = ""
  value       = "${module.flowlogs_dest_ap-northeast-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_ap-northeast-2" {
  description = ""
  value       = "${module.flowlogs_dest_ap-northeast-2.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_ap-south-1" {
  description = "ARN for Regional CloudWatch Logs Destination"

  value = "${module.flowlogs_dest_ap-south-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_ap-southeast-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_ap-southeast-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_ap-southeast-2" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_ap-southeast-2.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_ca-central-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_ca-central-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_eu-central-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_eu-central-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_eu-north-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_eu-north-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_eu-west-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_eu-west-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_eu-west-2" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_eu-west-2.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_eu-west-3" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_eu-west-3.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_sa-east-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_sa-east-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_us-east-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_us-east-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_us-east-2" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_us-east-2.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_us-west-1" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_us-west-1.flowlogs_cwl_destination_arn}"
}

output "flowlogs_cwl_dest_us-west-2" {
  description = "ARN for Regional CloudWatch Logs Destination"
  value       = "${module.flowlogs_dest_us-west-2.flowlogs_cwl_destination_arn}"
}
