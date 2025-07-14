# Use a small, security‑patched Python image
FROM python:3.9-slim

# Create an unprivileged user (optional but recommended)
RUN addgroup --system app && adduser --system --ingroup app app

# Set working directory
WORKDIR /app

# Copy & install only what we need
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source
COPY . .

# The Flask app listens on 5000
EXPOSE 5000

# Run the service
CMD ["python", "app.py"]
