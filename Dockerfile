# Use lightweight Debian base
FROM debian:stable-slim

# Set environment variables (legacy-compatible)
ENV PATH=/usr/games:$PATH

# Install prerequisites
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        netcat-openbsd \
        cowsay \
        fortune \
        bash \
        openssl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the script
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose the port
EXPOSE 4499

# Run the script
CMD ["bash", "./wisecow.sh"]
