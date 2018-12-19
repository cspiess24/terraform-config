# AWS

You can find some templates in here to quickly spin up resources to do testing. This guide assumes you already have terraform installed.

**Make sure you spin down resources when you are done using them.**

## Getting Started

If you do not have python installed, please do so now. Then install `aws-mfa`.

```none
pip install aws-mfa
```

### Access Key/Secret Key

1. You will need to generate an access key and secret key if you do not already have one. You can find info on how to do this at [Managing Access Keys for IAM Users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey) under the *Managing Access Keys (Console)* section.

2. Once you have your access key and secret key create, if it does not already exist, a credentials file `~/.aws/credentials` or on windows `(%UserProfile%\.aws\credentials)`. Add the following to your credentials file.

    ```none
    [default-long-term]
    aws_access_key_id = access_key_here
    aws_secret_access_key = secret_key_here
    ```

3. Now grab the ARN of your MFA device. You can find info on how to do this at [Checking MFA Status](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_checking-status.html) under the *To check the MFA status of IAM users* section. Your ARN will look like `arn:aws:iam::123456789012:mfa/username`. Running the following will update the credentials file with session information. You can rerun the command at anytime to see when your session expires or update the session if it has expired.

    ```none
    aws-mfa --device arn:aws:iam::123456789012:mfa/username
    ```

### Terraform

1. Now from a command line you will need to change to the directory with the config you want to deploy. If you are deploying a Fortigate `cd` to the fortigate directory.

2. Run `terraform init` to initialize the modeules and plugins.

3. If you want to see the changes you are about to make without making any chages run a `terrform plan`. Else proceed to the next step.

4. Run a `terraform apply`. This will print out the changes you are going to make, if everything looks good enter yes to execute the changes.

5. You should now have an environment running you can test against. Once you are done with your testing be sure to run a `terraform destroy` so we do not get billed for resources no longer being used.
