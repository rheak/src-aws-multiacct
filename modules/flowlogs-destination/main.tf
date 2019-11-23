# --------------------------------------------------------------------------------------------------
# Set up an AWS CloudWatch Logs Destination for the delivery of AWS FlowLogs from CloudWatch Logs to Kinesis.
# --------------------------------------------------------------------------------------------------

data "aws_region" "current" {}

resource "aws_cloudwatch_log_destination" "flowlogs_cwl_destination" {
  name       = "${var.cwl_destination_name}"
  role_arn   = "${var.CWL_To_Kinesis_role_arn}"
  target_arn = "${var.cwl_kinesis_stream_arn}"
}

resource "aws_cloudwatch_log_destination_policy" "flowlogs_cwl_destination_policy" {
  destination_name = "${aws_cloudwatch_log_destination.flowlogs_cwl_destination.name}"
  access_policy    = "${data.aws_iam_policy_document.flowlogs_cwl_destination_policy.json}"
}

data "aws_iam_policy_document" "flowlogs_cwl_destination_policy" {
  statement {
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = "${var.accts_list}"
    }

    actions = [
      "logs:PutSubscriptionFilter",
    ]

    resources = [
      "${aws_cloudwatch_log_destination.flowlogs_cwl_destination.arn}",
    ]
  }
}
