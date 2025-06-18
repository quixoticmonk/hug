# Ephemeral Retrieves - WITH Ephemeral Data Sources

This example shows how to use ephemeral data sources to retrieve sensitive data without storing it in Terraform state.

## What This Does

1. **Creates an ephemeral random password** and stores it in Secrets Manager
2. **Retrieves the secret using ephemeral data source** `ephemeral "aws_secretsmanager_secret_version"`
3. **Keeps the retrieved secret out of Terraform state** for security

## Key Features

- `ephemeral "aws_secretsmanager_secret_version"` - Retrieves secret during operation only
- Secret value is fetched fresh each time Terraform runs
- No sensitive data cached in state file
- Secure pattern for accessing external secrets

## Security Benefits

- Retrieved secrets never written to state
- State file remains non-sensitive
- Fresh retrieval ensures up-to-date values
- Compliant with zero-trust security models

## Workflow

1. Ephemeral password is generated
2. Password is stored in AWS Secrets Manager
3. Ephemeral data source retrieves the secret value
4. Secret is used in configuration but not persisted

## Usage

```bash
terraform init
terraform plan
terraform apply
```

The secret will be retrieved and used during the operation, but won't be found in the `terraform.tfstate` file.
