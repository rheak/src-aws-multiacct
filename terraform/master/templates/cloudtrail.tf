resource "aws_cloudtrail" "org_ct" {
  name                       = "${var.ct_name}"
  s3_bucket_name             = "${data.terraform_remote_state.log.outputs.ct_s3_bucket}"
  is_multi_region_trail      = true
  is_organization_trail      = true
  enable_log_file_validation = true
  cloud_watch_logs_role_arn  = "${aws_iam_role.CT-To-CWL-Role.arn}"
  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.CloudTrail.arn}"
  kms_key_id                 = "${data.terraform_remote_state.log.outputs.kms_key_cloudtrail_arn}"

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::"]
    }
  }

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::Lambda::Function"
      values = ["arn:aws:lambda"]
    }
  }
}

# ------------------------------------------------------------------------------------------------------------------------------------
# Default CloudTrail Cloudwatch Logs Group
# ------------------------------------------------------------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "CloudTrail" {
  name              = "CloudTrail/DefaultLogGroup"
  retention_in_days = "90"
}

# ------------------------------------------------------------------------------------------------------------------------------------
# CloudTrail to Cloudwatch Logs Role
# ------------------------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "CT-To-CWL-Role" {
  name = "CT-To-CWL-Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


# ------------------------------------------------------------------------------------------------------------------------------------
# CloudTrail to Cloudwatch Logs Policy
# ------------------------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy" "CT-To-CWL-Policy" {
  name = "CT-To-CWL-Policy"
  role = "${aws_iam_role.CT-To-CWL-Role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSCloudTrailCreateLogStream",
      "Effect": "Allow",
      "Action": "logs:CreateLogStream",
      "Resource": "${aws_cloudwatch_log_group.CloudTrail.arn}"
    },
    {
      "Sid": "AWSCloudTrailPutLogEvents",
      "Effect": "Allow",
      "Action": "logs:PutLogEvents",
      "Resource": "${aws_cloudwatch_log_group.CloudTrail.arn}"
    }
  ]
}
EOF
}
