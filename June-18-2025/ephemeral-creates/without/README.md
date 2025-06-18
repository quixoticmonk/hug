# Ephemeral Creates - WITHOUT Ephemeral Resources

This example shows the traditional approach of creating sensitive data using regular Terraform resources.

## What This Does

1. **Creates a random password** using `resource "random_password"`
2. **Password is stored in Terraform state** (security risk)
3. **Commented code shows** how it would be used with Secrets Manager

## Security Concerns

- Password is **stored in plaintext** in the Terraform state file
- State file becomes sensitive and requires careful handling
- Risk of accidental exposure through:
  - State file sharing
  - Version control commits
  - Backup systems
  - Log files

## State File Risk

After running `terraform apply`, you can see the password in the state file:

```bash
terraform show
# or
cat terraform.tfstate | grep -A5 -B5 "result"
```

## Why This Approach Is Problematic

- **Compliance Issues**: Many security frameworks require secrets not be stored in configuration management
- **Operational Risk**: State files need special handling and encryption
- **Team Collaboration**: Sharing state becomes a security concern
- **Audit Trail**: Sensitive data in state complicates audit requirements

## Usage

```bash
terraform init
terraform plan
terraform apply
```

**Warning**: The generated password will be visible in the `terraform.tfstate` file.
