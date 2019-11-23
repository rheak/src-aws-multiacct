# --------------------------------------------------------------------------------------------------
# Enables GuardDuty.
# --------------------------------------------------------------------------------------------------

resource "aws_guardduty_detector" "default" {
  enable = true
}

resource "aws_guardduty_member" "member" {
  for_each = var.accts_map

  depends_on         = ["aws_guardduty_detector.default"]
  account_id         = each.value
  detector_id        = "${aws_guardduty_detector.default.id}"
  email              = each.key
  invite             = true
  invitation_message = "please accept guardduty invitation"
}
