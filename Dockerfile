FROM python:3.10-slim

WORKDIR /app

# Install essential build tools required to compile Python packages on Raspberry Pi Zero 2 W
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    zlib1g-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Leverage Docker cache by copying requirements first
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# For docker_start.sh Convert Windows CRLF line endings to Linux LF to prevent execution errors (File DOS to Unix)
RUN sed -i 's/\r$//' docker_start.sh

RUN chmod +x docker_start.sh

CMD ["./docker_start.sh"]