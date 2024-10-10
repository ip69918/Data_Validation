# Start from a minimal Linux image
FROM ubuntu:latest

# Install dependencies for pyenv and Python builds
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential curl git libssl-dev libbz2-dev libreadline-dev \
    libsqlite3-dev wget ca-certificates zlib1g-dev libffi-dev \
    liblzma-dev && \
    rm -rf /var/lib/apt/lists/*

# Install pyenv
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"
RUN curl https://pyenv.run | bash

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
