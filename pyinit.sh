#!/bin/bash

# Step 1: Initialize project
uv init

# Step 2: Remove default pyproject.toml
rm pyproject.toml

# Step 3: Remove default hello.py
rm hello.py

# Step 4: Download your custom pyproject.toml
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/pyproject.toml -o pyproject.toml

# Step 5: Create virtual environment
uv venv

# Step 6: Activate virtual environment (POSIX-compatible)
source .venv/bin/activate

# Step 7: Install dev dependencies
# uv pip install -r pyproject.toml --extra dev
uv sync

echo "✔️ uv project initialized with custom pyproject.toml, venv activated and dev dependencies installed."
