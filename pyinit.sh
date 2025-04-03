#!/bin/bash

# Step 1: Initialize project
uv init

# Step 2: Remove default pyproject.toml
rm pyproject.toml

# Step 3: Download your custom pyproject.toml
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/pyproject.toml -o pyproject.toml

# Step 4: Create virtual environment
uv venv

# Step 5: Activate virtual environment (POSIX-compatible)
source .venv/bin/activate

echo "✔️ uv project initialized with custom pyproject.toml and venv activated"
