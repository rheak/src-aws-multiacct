module "config_sns_topic_ap-northeast-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.ap-northeast-1"
  }
}

module "config_sns_topic_ap-northeast-2" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.ap-northeast-2"
  }
}

module "config_sns_topic_ap-south-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.ap-south-1"
  }
}

module "config_sns_topic_ap-southeast-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.ap-southeast-1"
  }
}

module "config_sns_topic_ap-southeast-2" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.ap-southeast-2"
  }
}

module "config_sns_topic_ca-central-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.ca-central-1"
  }
}

module "config_sns_topic_eu-central-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.eu-central-1"
  }
}

module "config_sns_topic_eu-north-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.eu-north-1"
  }
}

module "config_sns_topic_eu-west-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.eu-west-1"
  }
}

module "config_sns_topic_eu-west-2" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "config_sns_topic_eu-west-3" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.eu-west-3"
  }
}

module "config_sns_topic_sa-east-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.sa-east-1"
  }
}

module "config_sns_topic_us-east-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"
}

module "config_sns_topic_us-east-2" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.us-east-2"
  }
}

module "config_sns_topic_us-west-1" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.us-west-1"
  }
}

module "config_sns_topic_us-west-2" {
  source         = "../../modules/sns-topic"
  sns_topic_name = "${var.config_sns_topic_name}"

  providers = {
    aws = "aws.us-west-2"
  }
}
