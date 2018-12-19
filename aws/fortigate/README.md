# Fortigate

By default this terrafrom configuration will deploy a Fortigate with version 5.4. You can override the default version if needed.

The following version are available:

* fgt-5-4 **(default)**
* fgt-5-6
* fgt-6-0

1. To override the default version create a `terraform.tfvars` files in the fortigate directory.

2. Add the following to the `terraform.tfvars` file. Set the version from the list of available versions above.

    ```none
    fortigate_version = "add_version_here"
    ```

3. In your `terraform.tfvars` set the account ID to deploy the configuration changes.

    ```none
    aws_account_id = "account_id"
    ```