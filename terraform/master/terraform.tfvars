Provide the name of the account that will serve as the GuardDuty Master (Security Account is recommended)
guardduty_master = "src-security"

master_acct = {
    name      = "src-master"
    email     = "src-master@sunrock-consulting.com"
    guardduty = "member"
}

member_accts = {
  smap-security = {
    name      = "src-security"
    email     = "src-security@sunrock-consulting.com"
    guardduty = "master"
    iam-billing = "ALLOW"
  },
  smap-log = {
    name      = "src-log"
    email     = "src-log@sunrock-consulting.com"
    guardduty = "member"
    iam-billing = "ALLOW"
  },
  smap-sharedservices = {
    name      = "src-sharedservices"
    email     = "src-sharedservices@sunrock-consulting.com"
    guardduty = "member"
    iam-billing = "ALLOW"
  }
}
