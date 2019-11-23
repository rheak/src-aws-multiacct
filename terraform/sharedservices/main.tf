data "aws_caller_identity" "current" {}

provider "aws" {
  profile = "${var.profile}"
  region  = "${var.main_region}"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "ap-northeast-1"
  profile = "${var.profile}"
  region  = "ap-northeast-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "ap-northeast-2"
  profile = "${var.profile}"
  region  = "ap-northeast-2"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "ap-south-1"
  profile = "${var.profile}"
  region  = "ap-south-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "ap-southeast-1"
  profile = "${var.profile}"
  region  = "ap-southeast-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "ap-southeast-2"
  profile = "${var.profile}"
  region  = "ap-southeast-2"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "ca-central-1"
  profile = "${var.profile}"
  region  = "ca-central-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "eu-central-1"
  profile = "${var.profile}"
  region  = "eu-central-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "eu-north-1"
  profile = "${var.profile}"
  region  = "eu-north-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "eu-west-1"
  profile = "${var.profile}"
  region  = "eu-west-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "eu-west-2"
  profile = "${var.profile}"
  region  = "eu-west-2"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "eu-west-3"
  profile = "${var.profile}"
  region  = "eu-west-3"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "sa-east-1"
  profile = "${var.profile}"
  region  = "sa-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "us-east-2"
  profile = "${var.profile}"
  region  = "us-east-2"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "us-west-1"
  profile = "${var.profile}"
  region  = "us-west-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}

provider "aws" {
  alias   = "us-west-2"
  profile = "${var.profile}"
  region  = "us-west-2"

  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_acct_id}:role/${var.org_name}-deploy-role"
    session_name = "deploy-session"
  }
}
