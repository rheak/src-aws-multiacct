resource "aws_s3_bucket" "tf-state" {
  bucket = "${var.org_name}-master-tf-state"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "${var.org_name}-master-tf-state"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "tfstate_s3_bucket_public_access" {
  depends_on = [
    aws_s3_bucket.tf-state,
    aws_s3_bucket_policy.tf-state-policy
  ]
  bucket = "${aws_s3_bucket.tf-state.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "tf-state-policy" {
  bucket = "${aws_s3_bucket.tf-state.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Allow Deploy User",
  "Statement": [
    {
      "Sid": "DeployAllow",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${var.provisioner_account_name}"
      },
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::${aws_s3_bucket.tf-state.id}/*",
        "arn:aws:s3:::${aws_s3_bucket.tf-state.id}"
        ]
    }
  ]
}
POLICY
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${var.org_name}-master-tf-state"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  server_side_encryption {
    enabled = true
  }
  attribute {
    name = "LockID"
    type = "S"
  }
  lifecycle {
    prevent_destroy = true
  }

}
