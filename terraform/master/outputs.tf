####################################################################
#                 Variables from ANSIBLE                           #
####################################################################
output "org_name" {
  description = "Output Org Name Defined so it an be consumed by Member Accounts"
  value = "${var.org_name}"
}

output "profile" {
  description = "Output The AWS Boto Profile Name Defined so it an be consumed by Member Accounts"
  value = "${var.profile}"
}

output "main_region" {
  description = "Output The Main AWS Region Name Defined so it an be consumed by Member Accounts"
  value = "${var.main_region}"
}

####################################################################
#                 AWS Organizations Outputs                        #
####################################################################
output "aws_org_id" {
  description = "Enterprise Logging Account ID"
  value = "${aws_organizations_organization.org.id}"
}

output "all_accts" {
  description = "(MAP) All Organization Accounts (Master and Members)"
  value = "${aws_organizations_organization.org.accounts}"
}

output "all_acct_ids" {
  description = "(LIST) A list of all account IDs in the organization"
  value = "${aws_organizations_organization.org.accounts.*.id}"
}

output "master_acct" {
  description = "(MAP) Enterprise Logging Account ID"
  value = "${aws_organizations_organization.org.master_account_id}"
}

output "member_accts" {
  description = "(MAP) All Organization Member Accounts"
  value = "${aws_organizations_organization.org.non_master_accounts}"
}

output "guardduty_master_acct_id" {
  description = "The AWS Account ID for the GuardDuty Master Account"
  value = "${aws_organizations_account.member["${var.guardduty_master}"].id}"
}

output "guardduty_member_accts" {
  description = "(MAP) All GuardDuty Member Accounts"
  value = {for x in aws_organizations_organization.org.accounts: x.email => x.id if x.name != "${var.guardduty_master_email}"}
}

output "log_acct" {
  description = "Enterprise Logging Account ID"
  value = "${aws_organizations_account.member["log"].id}"
}

output "sharedservices_acct" {
  description = "Enterprise Shared Services Account ID"
  value = "${aws_organizations_account.member["sharedservices"].id}"
}

output "security_acct" {
  description = "Enterprise Security Account ID"
  value = "${aws_organizations_account.member["security"].id}"
}
