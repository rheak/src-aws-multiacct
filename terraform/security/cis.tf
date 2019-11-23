# # ------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.1   Ensure a log metric filter and alarm exist for unauthorized API calls (Scored)
# # ------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-UnauthorizedAttemptCount" {
#   name           = "CIS-UnauthorizedAttemptCount"
#   pattern        = "{($.errorCode = *UnauthorizedOperation) || ($.errorCode = AccessDenied*)}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-UnauthorizedAttemptCount"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-UnauthorizedActivityAttempt" {
#   alarm_name          = "CIS-UnauthorizedActivityAttempt"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-UnauthorizedAttemptCount.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Alarm if Multiple unauthorized actions or logins attempted"
#   treat_missing_data  = "notBreaching"
# }
#
# # ------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.2   Ensure a log metric filter and alarm exist for Management Console sign-in without MFA (Scored)
# # ------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-NoMfaConsoleLogins" {
#   name           = "CIS-NoMfaConsoleLogins"
#   pattern        = "{($.eventName = ConsoleLogin) && ($.additionalEventData.MFAUsed != \"Yes\") && ($.responseElements.ConsoleLogin != Failure) && ($.additionalEventData.SamlProviderArn NOT EXISTS)}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-NoMfaConsoleLogins"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-NoMfaConsoleLogins" {
#   alarm_name          = "CIS-NoMfaConsoleLogins"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-NoMfaConsoleLogins.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Alarm if Multiple unauthorized actions or logins attempted"
#   treat_missing_data  = "notBreaching"
# }
#
# # ------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 1.1   Avoid the use of the "root" account (Scored)
# # CIS AWS Foundations Benchmark - 3.3   Ensure a log metric filter and alarm exist for usage of "root" account  (Scored)
# # ------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-IAMRootActivity" {
#   name           = "CIS-IAMRootActivity"
#   pattern        = "{($.userIdentity.type = Root) && ($.userIdentity.invokedBy NOT EXISTS) && ($.eventType != AwsServiceEvent)}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-IAMRootActivity"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-IAMRootActivity" {
#   alarm_name          = "CIS-IAMRootActivity"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-IAMRootActivity.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Alarm if a 'root' user uses the account"
#   treat_missing_data  = "notBreaching"
# }
#
# # ------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.4   Ensure a log metric filter and alarm exist for IAM policy changes (Scored)
# # ------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-DetectIamPolicyChanges" {
#   name           = "CIS-DetectIamPolicyChanges"
#   pattern        = "{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-DetectIamPolicyChanges"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-DetectIamPolicyChanges" {
#   alarm_name          = "CIS-DetectIamPolicyChanges"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-DetectIamPolicyChanges.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Detect IAM policy change events"
#   treat_missing_data  = "notBreaching"
# }
#
# # ------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.5   Ensure a log metric filter and alarm exist for CloudTrail configuration changes (Scored)
# # ------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-DetectCloudTrailChanges" {
#   name           = "CIS-DetectCloudTrailChanges"
#   pattern        = "{($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-DetectCloudTrailChanges"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-DetectCloudTrailChanges" {
#   alarm_name          = "CIS-DetectCloudTrailChanges"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-DetectCloudTrailChanges.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Detect CloudTrail Configuration change events"
#   treat_missing_data  = "notBreaching"
# }
#
# # --------------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.6 Ensure a log metric filter and alarm exist for AWS Management Console authentication failures (Scored)
# # --------------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-ConsoleLoginFailures" {
#   name           = "CIS-ConsoleLoginFailures"
#   pattern        = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\")}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-ConsoleLoginFailures"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-ConsoleLoginFailures" {
#   alarm_name          = "CIS-ConsoleLoginFailures"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-ConsoleLoginFailures.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Alarm if there are AWS Management Console authentication failures"
#   treat_missing_data  = "notBreaching"
# }
#
# # -------------------------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.7   Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs (Scored)
# # -------------------------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-KMSDisableKeyorScheduleKeyDeletion" {
#   name           = "CIS-KMSDisableKeyorScheduleKeyDeletion"
#   pattern        = "{($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey) || ($.eventName=ScheduleKeyDeletion))}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-KMSDisableKeyorScheduleKeyDeletion"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-KMSDisableKeyorScheduleKeyDeletion" {
#   alarm_name          = "CIS-KMSDisableKeyorScheduleKeyDeletion"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-KMSDisableKeyorScheduleKeyDeletion.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Alarm if customer created CMKs get disabled or scheduled for deletion"
#   treat_missing_data  = "notBreaching"
# }
#
# # -------------------------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.8   Ensure a log metric filter and alarm exist for S3 bucket policy changes (Scored)
# # -------------------------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-DetectS3BucketPolicyChanges" {
#   name           = "CIS-DetectS3BucketPolicyChanges"
#   pattern        = "{($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication))}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-DetectS3BucketPolicyChanges"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-DetectS3BucketPolicyChanges" {
#   alarm_name          = "CIS-DetectS3BucketPolicyChanges"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-DetectS3BucketPolicyChanges.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Detect S3 bucket policy change events"
#   treat_missing_data  = "notBreaching"
# }
#
# # -------------------------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.9   Ensure a log metric filter and alarm exist for AWS Config configuration changes (Scored)
# # -------------------------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-DetectConfigChanges" {
#   name           = "CIS-DetectConfigChanges"
#   pattern        = "{($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel)||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder))}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-DetectConfigChanges"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-DetectConfigChanges" {
#   alarm_name          = "CIS-DetectConfigChanges"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-DetectConfigChanges.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Detect AWS Config Configuration change events"
#   treat_missing_data  = "notBreaching"
# }
#
# # ------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.10  Ensure a log metric filter and alarm exist for security group changes (Scored)
# # ------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-DetectSecurityGroupChanges" {
#   name           = "CIS-DetectSecurityGroupChanges"
#   pattern        = "{($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup)}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-DetectSecurityGroupChanges"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-DetectSecurityGroupChanges" {
#   alarm_name          = "CIS-DetectSecurityGroupChanges"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-DetectSecurityGroupChanges.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Detect AWS Security Group change events"
#   treat_missing_data  = "notBreaching"
# }
#
# # --------------------------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.11  Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL) (Scored)
# # --------------------------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-DetectNetworkAclChanges" {
#   name           = "CIS-DetectNetworkAclChanges"
#   pattern        = "{($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation)}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-DetectNetworkAclChanges"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-DetectNetworkAclChanges" {
#   alarm_name          = "CIS-DetectNetworkAclChanges"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-DetectNetworkAclChanges.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Detect AWS Network ACL change events"
#   treat_missing_data  = "notBreaching"
# }
#
# # --------------------------------------------------------------------------------------------------------------------------------------------------------
# # CIS AWS Foundations Benchmark - 3.12  Ensure a log metric filter and alarm exist for changes to network gateways (Scored)
# # CIS AWS Foundations Benchmark - 3.13  Ensure a log metric filter and alarm exist for route table changes (Scored)
# # CIS AWS Foundations Benchmark - 3.14  Ensure a log metric filter and alarm exist for VPC changes (Scored)
# # --------------------------------------------------------------------------------------------------------------------------------------------------------
# resource "aws_cloudwatch_log_metric_filter" "CIS-DetectNetworkChangeEvents" {
#   name           = "CIS-DetectNetworkChangeEvents"
#   pattern        = "{($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) || ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) || ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink)}"
#   log_group_name = "${aws_cloudwatch_log_group.CloudTrail.name}"
#
#   metric_transformation {
#     name      = "CIS-DetectNetworkChangeEvents"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }
#
# resource "aws_cloudwatch_metric_alarm" "CIS-DetectNetworkChangeEvents" {
#   alarm_name          = "CIS-DetectNetworkChangeEvents"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "${aws_cloudwatch_log_metric_filter.CIS-DetectNetworkChangeEvents.name}"
#   namespace           = "CloudTrailMetrics"
#   period              = "300"
#   statistic           = "Sum"
#   threshold           = "1"
#   alarm_description   = "Detect AWS Network ACL change events"
#   treat_missing_data  = "notBreaching"
# }

