# Ephemeral Retrieves Example

This example demonstrates the difference between using ephemeral data sources and traditional data sources for retrieving sensitive data.

## What We're Demonstrating

Retrieving a secret value from AWS Secrets Manager, comparing ephemeral vs non-ephemeral data source approaches.

## Directories

### `with/` - Using Ephemeral Data Sources
- Uses `ephemeral "aws_secretsmanager_secret_version"` to retrieve the secret
- The secret value is fetched during operation but **not stored in state**
- Shows secure retrieval of sensitive data

### `without/` - Traditional Data Source Approach
- Uses `data "aws_secretsmanager_secret_version"` (traditional data source)
- The secret value **is stored in the Terraform state file**
- Creates security risk by persisting sensitive data

## Key Differences

| Aspect | With Ephemeral | Without Ephemeral |
|--------|----------------|-------------------|
| State Storage | Secret not in state | Secret stored in state |
| Security | Higher - no state exposure | Lower - state contains secrets |
| Data Lifecycle | Retrieved per operation | Cached in state |
| Compliance | Better for sensitive data | Requires state protection |

## Use Cases

- Retrieving database passwords for application configuration
- Fetching API keys for resource configuration
- Accessing certificates for TLS setup
- Reading any sensitive configuration data

## Security Impact

The ephemeral data source approach prevents sensitive values retrieved from external systems from being cached in the Terraform state file, maintaining security while allowing dynamic configuration.
