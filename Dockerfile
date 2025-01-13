# Use the official Python image with version 3.11
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Expose the port that the API will run on
EXPOSE 5000

# CMD ["streamlit", "run", "Groqqle.py"]

# Command to run the application in API mode
CMD ["python", "Groqqle.py", "api", "--num_results", "20", "--max_tokens", "4096"]