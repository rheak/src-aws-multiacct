# BEGIN Ansible imported Variables Block

org_name = "src"

profile = "default"

main_region = "us-east-1"
# END Ansible imported Variables Block

#Provide the name and email address of the account that will serve as the GuardDuty Master (Security Account is recommended)
guardduty_master = "security"
guardduty_master_email = "src-security@sunrock-consulting.com"

master_acct = {
    name      = "src-master"
    email     = "src-master@sunrock-consulting.com"
    guardduty = "member"
}

member_accts = {
  security = {
    name      = "src-security"
    email     = "src-security@sunrock-consulting.com"
    guardduty = "master"
  },
  log = {
    name      = "src-log"
    email     = "src-log@sunrock-consulting.com"
    guardduty = "member"
  },
  sharedservices = {
    name      = "src-sharedservices"
    email     = "src-sharedservices@sunrock-consulting.com"
    guardduty = "member"
  },
  src-prod1 = {
    name      = "SunRock - PROD1"
    email     = "karhea@gmail.com"
    guardduty = "member"
  },
  src-otsr = {
    name      = "OTSR - DEV1"
    email     = "outtatowners.dev@gmail.com"
    guardduty = "member"
  },
  src-prod = {
    name      = "src-prod"
    email     = "src-prod@sunrock-consulting.com"
    guardduty = "member"
  }
}
