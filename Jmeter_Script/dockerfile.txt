# Use the liukunup JMeter image
FROM liukunup/jmeter:5.6.2

# Set working directory inside container
WORKDIR /tests

# Copy your JMeter test plans into the container
COPY tests /tests

# Optional: default command to keep container running
CMD ["tail", "-f", "/dev/null"]
