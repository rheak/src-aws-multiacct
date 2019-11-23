# --------------------------------------------------------------------------------------------------
# Set up AWS SNS Topic for config to publish results and send notifications.
# --------------------------------------------------------------------------------------------------

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_sns_topic" "config" {
  name   = "${var.sns_topic_name}"
  policy = "${data.aws_iam_policy_document.config_sns_access_policy.json}"
}

data "aws_iam_policy_document" "config_sns_access_policy" {
  statement {
    sid = "DefaultAWSSNSPolicy"

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive",
    ]

    resources = ["arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.sns_topic_name}"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "667904703506",
      ]
    }
  }

  statement {
    sid = "AWSConfigSNSPolicy"

    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "config.amazonaws.com",
      ]
    }

    actions = ["SNS:Publish"]

    resources = ["arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.sns_topic_name}"]
  }
}
