resource "aws_organizations_account" "member" {
  for_each = var.member_accts

  name  = "${each.value.name}"
  email = "${each.value.email}"
  iam_user_access_to_billing = "${each.value.iam-billing}"
  role_name = "${var.org_name}-deploy-role"

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = ["role_name"]
  }
}
