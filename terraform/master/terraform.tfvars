#Provide the name of the account that will serve as the GuardDuty Master (Security Account is recommended)
# guardduty_master = "smap-security"
#
# master_acct = {
#     name      = "master"
#     acct_name = "mpg-eng-dev"
#     email     = "smap-master@sunrock-consulting.com"
#     guardduty = "member"
# }
#
# member_accts = {
#   smap-security = {
#     name      = "smap-security"
#     email     = "smap-security@sunrock-consulting.com"
#     guardduty = "master"
#     iam-billing = "ALLOW"
#   },
#   smap-log = {
#     name      = "smap-log"
#     email     = "smap-log@sunrock-consulting.com"
#     guardduty = "member"
#     iam-billing = "ALLOW"
#   },
#   smap-sharedservices = {
#     name      = "smap-sharedservices"
#     email     = "smap-sharedservices@sunrock-consulting.com"
#     guardduty = "member"
#     iam-billing = "ALLOW"
#   }
# }
