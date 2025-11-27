# Multi-stage build: Build stage
FROM 861972922519.dkr.ecr.us-east-1.amazonaws.com/cnt-infotech/maven:3.8.6-openjdk-8 AS builder

# Download and install Ant
RUN wget -q https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.12-bin.tar.gz && \
    tar -xzf apache-ant-1.10.12-bin.tar.gz -C /opt && \
    rm apache-ant-1.10.12-bin.tar.gz

# Set environment variables
ENV ANT_HOME=/opt/apache-ant-1.10.12
ENV PATH=$PATH:$ANT_HOME/bin

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Create WAR file directly from web directory
RUN mkdir -p dist && \
    cd web && \
    jar -cf ../dist/ASPAFIKO.war *

# Runtime stage
FROM 861972922519.dkr.ecr.us-east-1.amazonaws.com/cnt-infotech/tomcat:9.0-jdk8

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from builder stage
COPY --from=builder /app/dist/ASPAFIKO.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]