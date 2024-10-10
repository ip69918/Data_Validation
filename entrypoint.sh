#!/bin/bash
set -e

# Default to the latest Python version if not provided
if [ -z "$PYTHON_VERSION" ]; then
    PYTHON_VERSION="3.12.0"  # Set to a default version
fi

# Initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Check if the desired Python version is already installed
if ! pyenv versions | grep -q "$PYTHON_VERSION"; then
    echo "Installing Python $PYTHON_VERSION..."
    pyenv install "$PYTHON_VERSION"
else
    echo "Python $PYTHON_VERSION is already installed."
fi

# Set the global Python version
pyenv global "$PYTHON_VERSION"

# Ensure pip is available for the selected Python version
pip install --upgrade pip

# Install dependencies from requirements.txt
pip install --no-cache-dir -r requirements.txt

# Run Uvicorn to start the FastAPI application
exec uvicorn main:app --host 0.0.0.0 --port 8000
