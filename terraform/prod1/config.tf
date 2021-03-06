# --------------------------------------------------------------------------------------------------
# Create an IAM Role for AWS Config recorder to publish results and send notifications.
# Reference: https://docs.aws.amazon.com/config/latest/developerguide/gs-cli-prereq.html#gs-cli-create-iamrole
# --------------------------------------------------------------------------------------------------

resource "aws_iam_role" "recorder" {
  name = "${var.config_iam_role_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

# See https://docs.aws.amazon.com/config/latest/developerguide/iamrole-permissions.html
data "aws_iam_policy_document" "recoder_publish_policy" {
  statement {
    actions   = ["s3:PutObject"]
    resources = ["${data.terraform_remote_state.log.outputs.config_s3_bucket_arn}/*"]

    condition {
      test     = "StringLike"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    actions   = ["s3:GetBucketAcl"]
    resources = ["${data.terraform_remote_state.log.outputs.config_s3_bucket_arn}"]
  }
}

resource "aws_iam_role_policy" "recoder_publish_policy" {
  name   = "${var.config_iam_role_policy_name}"
  role   = "${aws_iam_role.recorder.id}"
  policy = "${data.aws_iam_policy_document.recoder_publish_policy.json}"
}

resource "aws_iam_role_policy_attachment" "recoder_read_policy" {
  role       = "${aws_iam_role.recorder.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

# --------------------------------------------------------------------------------------------------
# AWS Config Baseline
# Needs to be set up in each region.
# --------------------------------------------------------------------------------------------------

module "config_baseline_ap-northeast-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_ap-northeast-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.ap-northeast-1"
  }
}

module "config_baseline_ap-northeast-2" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_ap-northeast-2}"
  include_global_resources = "false"

  providers = {
    aws = "aws.ap-northeast-2"
  }
}

module "config_baseline_ap-south-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_ap-south-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.ap-south-1"
  }
}

module "config_baseline_ap-southeast-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_ap-southeast-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.ap-southeast-1"
  }
}

module "config_baseline_ap-southeast-2" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_ap-southeast-2}"
  include_global_resources = "false"

  providers = {
    aws = "aws.ap-southeast-2"
  }
}

module "config_baseline_ca-central-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_ca-central-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.ca-central-1"
  }
}

module "config_baseline_eu-central-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_eu-central-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.eu-central-1"
  }
}

module "config_baseline_eu-north-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_eu-north-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.eu-north-1"
  }
}

module "config_baseline_eu-west-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_eu-west-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.eu-west-1"
  }
}

module "config_baseline_eu-west-2" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_eu-west-2}"
  include_global_resources = "false"

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "config_baseline_eu-west-3" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_eu-west-3}"
  include_global_resources = "false"

  providers = {
    aws = "aws.eu-west-3"
  }
}

module "config_baseline_sa-east-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_sa-east-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.sa-east-1"
  }
}

module "config_baseline_us-east-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_us-east-1}"
  include_global_resources = "true"
}

module "config_baseline_us-east-2" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_us-east-2}"
  include_global_resources = "false"

  providers = {
    aws = "aws.us-east-2"
  }
}

module "config_baseline_us-west-1" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_us-west-1}"
  include_global_resources = "false"

  providers = {
    aws = "aws.us-west-1"
  }
}

module "config_baseline_us-west-2" {
  source                   = "../../modules/config-baseline"
  iam_role_arn             = "${aws_iam_role.recorder.arn}"
  s3_bucket_name           = "${data.terraform_remote_state.log.outputs.config_s3_bucket}"
  s3_key_prefix            = "${var.config_s3_bucket_key_prefix}"
  delivery_frequency       = "${var.config_delivery_frequency}"
  sns_topic_arn            = "${data.terraform_remote_state.log.outputs.config_topic_arn_us-west-2}"
  include_global_resources = "false"

  providers = {
    aws = "aws.us-west-2"
  }
}
