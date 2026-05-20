### Dockerfile for Python Flask application
### Use a lightweight base image
FROM python:3.11-slim

### Set environment variables
ENV PYTHONUNBUFFERED 1
ENV FLASK_APP app.py
ENV PORT 8080

### Create app directory
WORKDIR /app

### Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

### Copy application code
COPY . .

### Command to run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "2", "--threads", "4", "app:app"]
