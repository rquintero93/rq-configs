#!/bin/bash

# Step 1: Initialize project
uv init

# Step 2: Remove default pyproject.toml and .gitignore
rm pyproject.toml
rm .gitignore

# Step 3: Remove default hello.py
rm main.py

# Step 4: Download your custom pyproject.toml .gitignore and .dockerignore
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/pyproject.toml -o pyproject.toml
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/gitignore_template -o .gitignore
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/dockerignore_template -o .dockerignore
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/docker_template -o Dockerfile

# Step 5: Create virtual environment
uv venv

# Step 6: Activate virtual environment (POSIX-compatible)
source .venv/bin/activate

# Step 7: Install dev dependencies
uv sync

# Step 8: Create a new main.py file
mkdir src && touch src/main.py

# Step 9: Create a new tests directory
mkdir tests

echo "✔️ uv project initialized"
