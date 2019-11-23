resource "aws_kms_key" "cloudtrail" {
  description         = "KMS Key used by Master Account to encrypt CloudTrail Logs"
  enable_key_rotation = true
  is_enabled          = true
  policy              = "${data.aws_iam_policy_document.kms_cloudtrail_policy.json}"
}

resource "aws_kms_alias" "kms_cloudtrail_key_alias" {
  name          = "alias/cloudtrail"
  target_key_id = "${aws_kms_key.cloudtrail.key_id}"
}

data "aws_iam_policy_document" "kms_cloudtrail_policy" {
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions   = ["kms:*"]
    resources = ["*"]
  }

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::${data.terraform_remote_state.master.outputs.master_acct}:root",
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::${data.terraform_remote_state.master.outputs.master_acct}:root",
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }

    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant",
    ]

    resources = ["*"]

    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"

      values = [
        "true",
      ]
    }
  }

  statement {
    sid    = "Allow CloudTrail to encrypt logs"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "kms:GenerateDataKey*",
    ]

    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "kms:EncryptionContext:aws:cloudtrail:arn"

      values = [
        "arn:aws:cloudtrail:*:*:trail/*"
      ]
    }
  }

  statement {
    sid    = "Allow CloudTrail to describe key"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "kms:DescribeKey",
    ]

    resources = ["*"]
  }
}
