# --------------------------------------------------------------------------------------------------
# GuardDuty Baseline
# Needs to be set up in each region.
# This is an extra configuration which is not included in CIS benchmark.
# --------------------------------------------------------------------------------------------------

module "guardduty_baseline_ap-northeast-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.ap-northeast-1"
  }
}

module "guardduty_baseline_ap-northeast-2" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.ap-northeast-2"
  }
}

module "guardduty_baseline_ap-south-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.ap-south-1"
  }
}

module "guardduty_baseline_ap-southeast-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.ap-southeast-1"
  }
}

module "guardduty_baseline_ap-southeast-2" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.ap-southeast-2"
  }
}

module "guardduty_baseline_ca-central-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.ca-central-1"
  }
}

module "guardduty_baseline_eu-central-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.eu-central-1"
  }
}

module "guardduty_baseline_eu-north-1" {
  source = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.eu-north-1"
  }
}

module "guardduty_baseline_eu-west-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.eu-west-1"
  }
}

module "guardduty_baseline_eu-west-2" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "guardduty_baseline_eu-west-3" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.eu-west-3"
  }
}

module "guardduty_baseline_sa-east-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.sa-east-1"
  }
}

module "guardduty_baseline_us-east-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"
}

module "guardduty_baseline_us-east-2" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.us-east-2"
  }
}

module "guardduty_baseline_us-west-1" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.us-west-1"
  }
}

module "guardduty_baseline_us-west-2" {
  source                   = "../../modules/guardduty-member"
  guardduty_master_acct_id = "${aws_organizations_account.member["${var.guardduty_master}"].id}"

  providers = {
    aws = "aws.us-west-2"
  }
}
