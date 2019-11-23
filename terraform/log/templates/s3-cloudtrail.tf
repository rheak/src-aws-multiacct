resource "aws_s3_bucket" "ct_s3_bucket" {
  bucket = "${var.ct_log_bucket_name}"
}

resource "aws_s3_bucket_public_access_block" "ct_s3_bucket_public_access" {
  depends_on = [
    aws_s3_bucket.ct_s3_bucket,
  ]
  bucket = "${aws_s3_bucket.ct_s3_bucket.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "ct_s3_bucket_policy" {
  depends_on = [
    aws_s3_bucket.ct_s3_bucket,
    aws_s3_bucket_public_access_block.ct_s3_bucket_public_access
  ]
  bucket = "${aws_s3_bucket.ct_s3_bucket.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "OrgCloudTrailPolicy",
  "Statement": [
    {
      "Sid": "AWSCloudTrailAclCheck",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::${var.ct_log_bucket_name}"
    },
    {
      "Sid": "AWSCloudTrailWrite",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": [
        "arn:aws:s3:::${var.ct_log_bucket_name}/*",
        "arn:aws:s3:::${var.ct_log_bucket_name}/AWSLogs/${data.terraform_remote_state.master.outputs.aws_org_id}/*"
      ],
      "Condition": {"StringEquals": {"s3:x-amz-acl": "bucket-owner-full-control"}}
    }
  ]
}
POLICY
  lifecycle {
    prevent_destroy = true
  }
}
