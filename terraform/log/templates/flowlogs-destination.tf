resource "aws_iam_role" "CWLKinesis_iam_role" {
  name = "${var.CWLKinesis_iam_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "logs.ap-northeast-1.amazonaws.com",
          "logs.ap-northeast-2.amazonaws.com",
          "logs.ap-south-1.amazonaws.com",
          "logs.ap-southeast-1.amazonaws.com",
          "logs.ap-southeast-2.amazonaws.com",
          "logs.ca-central-1.amazonaws.com",
          "logs.eu-central-1.amazonaws.com",
          "logs.eu-north-1.amazonaws.com",
          "logs.eu-west-1.amazonaws.com",
          "logs.eu-west-2.amazonaws.com",
          "logs.eu-west-3.amazonaws.com",
          "logs.sa-east-1.amazonaws.com",
          "logs.us-east-1.amazonaws.com",
          "logs.us-east-2.amazonaws.com",
          "logs.us-west-1.amazonaws.com",
          "logs.us-west-2.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#########################################
# VPC Flow Logs IAM policy (CWL_To_Kinesis)
#########################################
resource "aws_iam_role_policy" "CWLKinesis_iam_policy" {
  name = "${var.CWLKinesis_iam_policy_name}"
  role = "${aws_iam_role.CWLKinesis_iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "kinesis:PutRecord"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#########################################
# VPC Flow Logs Kinesis Stream
#########################################
resource "aws_kinesis_stream" "flowlogs_kinesis_stream" {
  name             = "${var.kinesis_stream_name}"
  shard_count      = "${var.kinesis_shard_count}"
  retention_period = "${var.kinesis_retention_period}"
  encryption_type  = "${var.kinesis_encryption_type}"
  kms_key_id       = "${var.kinesis_encryption_key_id}"
}

# --------------------------------------------------------------------------------------------------
# AWS Flow Logs Setup
# Needs to be set up in each region.
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
# Set up an AWS CloudWatch Logs Destination for the delivery of AWS FlowLogs from CloudWatch Logs to Kinesis.
# --------------------------------------------------------------------------------------------------
module "flowlogs_dest_ap-northeast-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.ap-northeast-1"
  }
}

module "flowlogs_dest_ap-northeast-2" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.ap-northeast-2"
  }
}

module "flowlogs_dest_ap-south-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.ap-south-1"
  }
}

module "flowlogs_dest_ap-southeast-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.ap-southeast-1"
  }
}

module "flowlogs_dest_ap-southeast-2" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.ap-southeast-2"
  }
}

module "flowlogs_dest_ca-central-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.ca-central-1"
  }
}

module "flowlogs_dest_eu-central-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.eu-central-1"
  }
}

module "flowlogs_dest_eu-north-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.eu-north-1"
  }
}

module "flowlogs_dest_eu-west-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.eu-west-1"
  }
}

module "flowlogs_dest_eu-west-2" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "flowlogs_dest_eu-west-3" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.eu-west-3"
  }
}

module "flowlogs_dest_sa-east-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.sa-east-1"
  }
}

module "flowlogs_dest_us-east-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"
}

module "flowlogs_dest_us-east-2" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.us-east-2"
  }
}

module "flowlogs_dest_us-west-1" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.us-west-1"
  }
}

module "flowlogs_dest_us-west-2" {
  source                  = "../../modules/flowlogs-destination"
  CWL_To_Kinesis_role_arn = "${aws_iam_role.CWLKinesis_iam_role.arn}"
  cwl_destination_name    = "${var.cwl_destination_name}"
  cwl_kinesis_stream_arn  = "${aws_kinesis_stream.flowlogs_kinesis_stream.arn}"
  accts_list              = "${data.terraform_remote_state.master.outputs.all_acct_ids}"

  providers = {
    aws = "aws.us-west-2"
  }
}
