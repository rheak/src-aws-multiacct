# --------------------------------------------------------------------------------------------------
# Set up AWS FlowLogs to be delivered to CloudWatch Logs and add subscription to Log Group to send to Central Logging Acct.
# --------------------------------------------------------------------------------------------------

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

#########################################
# VPC Flow Logs Cloudwatch Logs Log Group
#########################################
resource "aws_cloudwatch_log_group" "flowlogs_loggroup" {
  name              = "${var.loggroup_name}"
  retention_in_days = "${var.retention_in_days}"
}

##################################################
# VPC Flow Logs CLoudwatch Logs Group Subscription
##################################################
resource "aws_cloudwatch_log_subscription_filter" "flowlogs_loggroup_subscription" {
  depends_on      = ["aws_cloudwatch_log_group.flowlogs_loggroup"]
  name            = "${var.subscription_name}"
  log_group_name  = "${var.loggroup_name}"
  filter_pattern  = ""
  destination_arn = "${var.subscription_destination_arn}"
  distribution    = "ByLogStream"
}
