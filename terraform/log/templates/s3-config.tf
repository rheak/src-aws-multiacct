resource "aws_s3_bucket" "config_s3_bucket" {
  bucket = "${var.config_log_bucket_name}"
  policy = "${data.aws_iam_policy_document.config_s3_bucket_policy.json}"
}

resource "aws_s3_bucket_public_access_block" "config_s3_bucket_public_access" {
  bucket = "${aws_s3_bucket.config_s3_bucket.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "config_s3_bucket_policy" {
  statement {
    sid = "AWSConfigAclCheck"

    effect = "Allow"

    principals {
      type = "Service"

      identifiers = ["config.amazonaws.com"]
    }

    actions = ["s3:GetBucketAcl"]

    resources = ["arn:aws:s3:::${var.config_log_bucket_name}"]
  }

  statement {
    sid = "AWSConfigWrite"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.config_log_bucket_name}/AWSLogs/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control",
      ]
    }
  }
}
