# Terraform Variables

Variables in Terraform serve as parameters for Terraform configurations, allowing you to customize, organize, and reuse your configurations across various environments or scenarios.

## 1. Definition:

Variables are declared within Terraform configuration files and can be used to parametrize many elements, from resource attributes to module inputs, outputs, and more.

## 2. Basic Usage:

### Declaration:
```markdown
```hcl
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```

### Reference:

Once declared, the variable can be referred to within the configuration using `var.instance_type`.

## 3. Types and Validation:

Terraform variables support specific types like `string`, `list`, `map`, `number`, and `bool`. Additionally, you can use complex types and type constraints. The `validation` block can be used to enforce specific value constraints or checks on variables.

```hcl
variable "image_id" {
  type        = string
  description = "The ID of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI ID, starting with 'ami-'."
  }
}
```

## 4. Default Values and Required Variables:

You can provide default values for variables. If no value is provided by the user when running Terraform commands, the default value will be used. If no default is set, the variable is considered required, and a value must be supplied by the user.

## 5. Input Variables:

These are typically used to pass values into a Terraform configuration when `terraform apply` or `terraform plan` is run. Values can be provided using CLI flags, from a file using `-var-file`, or will be prompted for input if not supplied.

## 6. Environment Variables:

Terraform will read environment variables to get values for variables. These have the format `TF_VAR_name`, where `name` is the variable's name. For example, `TF_VAR_instance_type` would set the `instance_type` variable.

## 7. Output Values:

While technically different from input variables, outputs in Terraform serve to expose a subset of the state as named values. These can then be used in other configurations or returned to the user.

```hcl
output "instance_ip" {
  value = aws_instance.my_instance.public_ip
}
```

## 8. Variable Precedence:
![Screenshot from 2024-01-18 10-44-06](https://github.com/satyanarayana-senapathi/DevOps/assets/119926529/5c4b6932-91ba-4e00-a1ec-a4f43109c16a)

If a variable is defined in multiple places, Terraform uses a specific order of precedence:

1. Environment variables.
2. `terraform.tfvars` and `terraform.tfvars.json` files.
3. `.tfvars` and `.tfvars.json` files.
4. Variable defaults from the configuration.

It's essential to be aware of this order to understand which value will be used if a variable is defined in multiple locations.
```
