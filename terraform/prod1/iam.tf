resource "aws_iam_account_password_policy" "cis" {
  # 1.5
  require_uppercase_characters = "${var.iam_require_uppercase_characters}"

  # 1.6
  require_lowercase_characters = "${var.iam_require_lowercase_characters}"

  # 1.7
  require_symbols = "${var.iam_require_symbols}"

  # 1.8
  require_numbers = "${var.iam_require_numbers}"

  # 1.9
  minimum_password_length = "${var.iam_minimum_password_length}"

  # 1.10
  password_reuse_prevention = "${var.iam_password_reuse_prevention}"

  # 1.11
  max_password_age = "${var.iam_max_password_age}"

  allow_users_to_change_password = "${var.iam_allow_users_to_change_password}"

  hard_expiry = "${var.iam_hard_expiry}"
}
