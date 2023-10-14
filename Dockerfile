FROM python:3.9

# Create a non-root user and give it permissions
RUN groupadd -g 1001 appgroup && useradd -r -u 1001 -g appgroup -d /home/appuser -s /bin/bash appuser

# Set the working directory and user
WORKDIR /app
USER appuser

# Create the necessary directory and set permissions
RUN mkdir -p /home/appuser/.local/bin && \
  chown -R appuser:appgroup /home/appuser

# Set environment variables
ENV PATH="/home/appuser/.local/bin:${PATH}"

# Copy requirements and install packages in user's home directory
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --user -r /app/requirements.txt

# Copy the application files
COPY main.py /app/main.py

# Run the application
CMD ["python", "/app/main.py"]
