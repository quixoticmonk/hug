# Ephemeral Retrieves - WITHOUT Ephemeral Data Sources

This example shows the traditional approach of retrieving sensitive data using regular Terraform data sources.

## What This Does

1. **Creates an ephemeral random password** and stores it in Secrets Manager
2. **Retrieves the secret using traditional data source** `data "aws_secretsmanager_secret_version"`
3. **Secret value is cached in Terraform state** (security risk)

## Security Concerns

- Retrieved secret is **stored in the Terraform state file**
- State file becomes sensitive and requires encryption
- Risk of exposing secrets through:
  - State file access
  - State file backups
  - Remote state storage
  - Team collaboration

## State File Risk

After running `terraform apply`, the secret value will be visible in the state:

```bash
terraform show
# or
terraform state show data.aws_secretsmanager_secret_version.db_password
```

## Performance vs Security Trade-off

**Traditional Approach Benefits:**
- Faster subsequent runs (cached in state)
- Reduced API calls to AWS
- Offline plan generation possible

**Security Costs:**
- Sensitive data in state file
- State encryption requirements
- Complex state management
- Compliance challenges

## Why This Approach Is Problematic

- **Data Exposure**: Secrets visible in state file
- **State Management**: Requires secure state storage
- **Team Access**: State access = secret access
- **Audit Complexity**: Tracking secret access through state

## Usage

```bash
terraform init
terraform plan
terraform apply
```

**Warning**: The retrieved secret value will be stored in the `terraform.tfstate` file.
