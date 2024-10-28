FROM python:3.8.18

WORKDIR /app

# Install netcat-openbsd (or netcat-traditional) and clean up
RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt
