# --------------------------------------------------------------------------------------------------
# Enables GuardDuty.
# --------------------------------------------------------------------------------------------------

resource "aws_guardduty_detector" "default" {
  enable = true
}

resource "aws_guardduty_invite_accepter" "member" {
  detector_id       = "${aws_guardduty_detector.default.id}"
  master_account_id = "${var.guardduty_master_acct_id}"
}
