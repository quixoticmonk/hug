# Ephemeral Creates - WITH Ephemeral Resources

This example shows how to use ephemeral resources to create sensitive data without storing it in Terraform state.

## What This Does

1. **Creates an ephemeral random password** using `ephemeral "random_password"`
2. **Stores the password in AWS Secrets Manager** using the ephemeral value
3. **Keeps the password out of Terraform state** for security

## Key Features

- `ephemeral "random_password"` - Generates password during operation only
- `secret_string_wo` - Uses the ephemeral password value
- Password is never written to Terraform state file
- Commented examples show ephemeral outputs and locals usage

## Security Benefits

- No sensitive data in state file
- Reduced risk of password exposure
- Compliant with security best practices
- State file can be safely shared or stored

## Usage

```bash
terraform init
terraform plan
terraform apply
```

The password will be created and stored in Secrets Manager, but you won't find it in the `terraform.tfstate` file.
