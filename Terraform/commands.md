## Terraform Commands

1. **Initialization**
   - `terraform init`: Initializes a new or existing Terraform configuration by installing modules and setting up backend storage for state.

2. **Planning and Applying**
   - `terraform plan`: Creates an execution plan, showing which actions Terraform will take to apply your configuration.
   - `terraform apply`: Applies the changes required to achieve the desired state of the configuration.
   - `terraform destroy`: Destroys resources managed by your Terraform configuration.

3. **State Management**
   - `terraform state list`: Lists resources in the state.
   - `terraform state show [address]`: Shows the details of a specific resource in the state.
   - `terraform state mv`: Moves resources within a state or between states.
   - `terraform state rm`: Removes resources from state.

4. **Modules and Providers**
   - `terraform get`: Downloads and installs modules for the configuration.
   - `terraform providers`: Lists the providers required for the configuration.

5. **Utilities**
   - `terraform validate`: Checks whether the configuration is syntactically valid and internally consistent.
   - `terraform fmt`: Rewrites configuration files to a canonical format and style.
   - `terraform version`: Prints the current version of Terraform.
   - `terraform workspace list`: Lists all workspaces.
   - `terraform workspace new [name]`: Creates a new workspace.
   - `terraform workspace select [name]`: Switches to a different workspace.
   - `terraform workspace delete [name]`: Deletes a workspace.

6. **Outputs and Inputs**
   - `terraform output`: Displays outputs from your modules.
   - `terraform refresh`: Updates the state file with real-world infrastructure details (less commonly used in newer versions of Terraform due to improvements in `apply` and `plan`).

7. **Importing Existing Infrastructure**
   - `terraform import [address] [ID]`: Allows you to take already running infrastructure and bring it under Terraform management.

8. **Tainting and Untainting Resources**
   - `terraform taint [address]`: Marks a resource as "tainted", forcing it to be destroyed and recreated during the next apply.
   - `terraform untaint [address]`: Removes the "tainted" status from a resource.
