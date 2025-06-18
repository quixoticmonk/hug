#!/bin/bash

# Centralized Checkov runner for Terraform ephemerality feature demo
# Usage: ./run_checkov.sh <directory_path>
# Example: ./run_checkov.sh ephemeral-creates/with

# Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory_path>"
    echo "Example: $0 ephemeral-creates/with"
    echo "Available directories:"
    find . -name "main.tf" -exec dirname {} \; | sort
    exit 1
fi

TARGET_DIR="$1"

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist"
    exit 1
fi

# Check if main.tf exists in the target directory
if [ ! -f "$TARGET_DIR/main.tf" ]; then
    echo "Error: main.tf not found in '$TARGET_DIR'"
    exit 1
fi

echo "Running Checkov on $TARGET_DIR/main.tf..."
echo "=========================================="

# Run Checkov with external ephemeral checks
# This script runs Checkov against main.tf using custom ephemeral resource checks
# from the quixoticmonk/checkov-ephemerality-custom-checks repository
checkov -f "$TARGET_DIR/main.tf" \
    --external-checks-git https://github.com/quixoticmonk/checkov-ephemerality-custom-checks.git \
    --external-checks-dir checks \
    --framework terraform \
    --check CKV2_EPH_CREATE,CKV2_EPH_RET,CKV2_EPH_WO

echo "=========================================="
echo "Checkov scan completed for $TARGET_DIR"
