1. Setup Master Account
  a. Create New AWS Account
    i. Provide Valid Email address
    ii. Create Complex Pasword
    iii. Choose Account Name
    iv. Provide Contact Information
    v. Agree to Terms of Service
    vi. Provide a Valid Payment Method
    vii. Delegate Billing Portal Access to IAM Users
  b. Secure Root Account
    i. Delete Root Account Access Keys
      1) Should not exist by default. Do Not Create Access Keys Associated with Root Account
    ii. Activate Multi-Factor Authentication (MFA)
      1) Store the MFA information in a secure vaulted location

  c. Create Provisioner IAM Account and Credentials
    i. Create IAM User with Administrator Access Policy Attached
      1) This Account will be removed once provisioning has been completed
    ii. Give the Provisioner Account Programmatic Access and Save the credentials

  d. Create Master Account Baseline
    i. Prerequisites:
      1) Terraform 0.12 or greater installed on control machine used for initial provisioning
      2) Ansible 2.8 or greater
      3) AWS CLI 1.16.243 or greater
      4) Python 3 +
      5) AWS Access Keys for the Master Account Provisioned above in 1.c.ii
      6) MPG's Secure Multi Account Provisioning Repository Cloned to control machine
      7) Configure the aws default boto profile 'aws configure'
  e. Run ansible/main.yml 
