##########################################
# VPC Flow Logs IAM Role (FlowLogs_To_CWL)
##########################################
resource "aws_iam_role" "FlowLogsCWL_iam_role" {
  name = "${var.FlowLogsCWL_iam_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "vpc-flow-logs.amazonaws.com"
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
# VPC Flow Logs IAM policy (FlowLogs_To_CWL)
#########################################
resource "aws_iam_role_policy" "FlowLogsCWL_iam_policy" {
  name = "${var.FlowLogsCWL_iam_policy_name}"
  role = "${aws_iam_role.FlowLogsCWL_iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# --------------------------------------------------------------------------------------------------
# AWS Flow Logs Setup
# Needs to be set up in each region.
# --------------------------------------------------------------------------------------------------

module "flowlogs_ap-northeast-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_ap-northeast-1}"

  providers = {
    aws = "aws.ap-northeast-1"
  }
}

module "flowlogs_ap-northeast-2" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_ap-northeast-2}"

  providers = {
    aws = "aws.ap-northeast-2"
  }
}

module "flowlogs_ap-south-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_ap-south-1}"

  providers = {
    aws = "aws.ap-south-1"
  }
}

module "flowlogs_ap-southeast-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_ap-southeast-1}"

  providers = {
    aws = "aws.ap-southeast-1"
  }
}

module "flowlogs_ap-southeast-2" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_ap-southeast-2}"

  providers = {
    aws = "aws.ap-southeast-2"
  }
}

module "flowlogs_ca-central-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_ca-central-1}"

  providers = {
    aws = "aws.ca-central-1"
  }
}

module "flowlogs_eu-central-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_eu-central-1}"

  providers = {
    aws = "aws.eu-central-1"
  }
}

module "flowlogs_eu-north-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_eu-north-1}"

  providers = {
    aws = "aws.eu-north-1"
  }
}

module "flowlogs_eu-west-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_eu-west-1}"

  providers = {
    aws = "aws.eu-west-1"
  }
}

module "flowlogs_eu-west-2" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_eu-west-2}"

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "flowlogs_eu-west-3" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_eu-west-3}"

  providers = {
    aws = "aws.eu-west-3"
  }
}

module "flowlogs_sa-east-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_sa-east-1}"

  providers = {
    aws = "aws.sa-east-1"
  }
}

module "flowlogs_us-east-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_us-east-1}"
}

module "flowlogs_us-east-2" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_us-east-2}"

  providers = {
    aws = "aws.us-east-2"
  }
}

module "flowlogs_us-west-1" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_us-west-1}"

  providers = {
    aws = "aws.us-west-1"
  }
}

module "flowlogs_us-west-2" {
  source                       = "../../modules/flowlogs"
  loggroup_name                = "${var.flowlogs_loggroup_name}"
  subscription_name            = "${var.flowlogs_subscription_name}"
  subscription_destination_arn = "${data.terraform_remote_state.log.outputs.flowlogs_cwl_dest_us-west-2}"

  providers = {
    aws = "aws.us-west-2"
  }
}
